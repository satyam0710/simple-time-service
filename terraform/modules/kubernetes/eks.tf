
# Fetch the TLS certificate data for the EKS OIDC issuer URL
data "tls_certificate" "eks" {
  url = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}

# AWS EKS cluster
resource "aws_eks_cluster" "cluster" {
  name = var.eks_cluster_name

  role_arn = aws_iam_role.cluster_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [aws_iam_role_policy_attachment.eks_cluster_role_policy_attachment]
}

# EKS Addons
resource "aws_eks_addon" "vpc_cni" {
  cluster_name                = var.eks_cluster_name
  addon_name                  = "vpc-cni"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on = [
    aws_eks_cluster.cluster,
    aws_eks_node_group.app_node_group
  ]
}
resource "aws_eks_addon" "coredns" {
  cluster_name                = var.eks_cluster_name
  addon_name                  = "coredns"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  configuration_values = jsonencode({
    deployment = {
      tolerations = [
        {
          key      = "node.cloudprovider.kubernetes.io/uninitialized"
          operator = "Equal"
          value    = "true"
          effect   = "NoSchedule"
        },
        {
          key      = "node-role.kubernetes.io/master"
          operator = "Exists"
          effect   = "NoSchedule"
        },
        {
          key      = "node-role.kubernetes.io/control-plane"
          operator = "Exists"
          effect   = "NoSchedule"
        }
      ]
    }
  })
  depends_on = [
    aws_eks_cluster.cluster,
    aws_eks_node_group.app_node_group,
    aws_eks_addon.vpc_cni
  ]
}
resource "aws_eks_addon" "kube_proxy" {
  cluster_name                = var.eks_cluster_name
  addon_name                  = "kube-proxy"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on = [
    aws_eks_cluster.cluster,
    aws_eks_node_group.app_node_group,
    aws_eks_addon.vpc_cni
  ]
}

resource "aws_eks_addon" "aws_ebs_csi_driver" {
  cluster_name                = var.eks_cluster_name
  addon_name                  = "aws-ebs-csi-driver"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  service_account_role_arn    = module.iam_assumable_role_with_oidc_ebs_csi_driver.this_iam_role_arn
  configuration_values = jsonencode({
    node = {
      extraArgs = [
        "--metadata-sources=kubernetes"
      ]
    }
  })
  depends_on = [
    aws_eks_cluster.cluster,
    aws_eks_node_group.app_node_group,
    aws_eks_addon.vpc_cni
  ]
}


# Define an IAM OpenID Connect Provider for EKS
resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}

# Define an EKS node group for private nodes
resource "aws_eks_node_group" "app_node_group" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = var.app_node_group_name
  node_role_arn   = aws_iam_role.node_role.arn

  subnet_ids     = var.subnet_ids
  capacity_type  = var.app_node_group_capacity_type
  disk_size      = var.app_node_group_disk_size
  instance_types = var.app_node_group_instance_type

  scaling_config {
    desired_size = var.app_node_group_desired
    max_size     = var.app_node_group_max
    min_size     = var.app_node_group_min
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "general"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_role_policy_attachment,
    aws_iam_role_policy_attachment.eks_cni_role_policy_attachment,
    aws_iam_role_policy_attachment.ecr_read_only_role_policy_attachment,
  ]
}

locals {
  map_roles = [
    {
      rolearn  = aws_iam_role.node_role.arn
      username = "system:node:{{EC2PrivateDNSName}}"
      groups   = ["system:bootstrappers", "system:nodes"]
    }
  ]
}

resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = yamlencode(local.map_roles)
  }
}
