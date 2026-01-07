# # Cluster Autoscaler
# # This deploys the Kubernetes Cluster Autoscaler which automatically adjusts the number of nodes in your cluster

# # IAM Role for Cluster Autoscaler
# module "iam_assumable_role_cluster_autoscaler" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
#   version = "~> 3.0"

#   create_role = true
#   role_name   = "${var.name}-cluster-autoscaler-role-${var.environment}"

#   tags = {
#     Role = "${var.name}-cluster-autoscaler-role-${var.environment}"
#   }

#   provider_url = replace(aws_iam_openid_connect_provider.eks.url, "https://", "")

#   role_policy_arns = [
#     aws_iam_policy.cluster_autoscaler.arn
#   ]

#   number_of_role_policy_arns = 1

#   oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:cluster-autoscaler"]
# }

# # IAM Policy for Cluster Autoscaler
# resource "aws_iam_policy" "cluster_autoscaler" {
#   name        = "${var.name}-cluster-autoscaler-policy-${var.environment}"
#   path        = "/"
#   description = "IAM policy for Cluster Autoscaler"
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "autoscaling:DescribeAutoScalingGroups",
#           "autoscaling:DescribeAutoScalingInstances",
#           "autoscaling:DescribeLaunchConfigurations",
#           "autoscaling:DescribeScalingActivities",
#           "autoscaling:DescribeTags",
#           "ec2:DescribeImages",
#           "ec2:DescribeInstanceTypes",
#           "ec2:DescribeLaunchTemplateVersions",
#           "ec2:GetInstanceTypesFromInstanceRequirements",
#           "eks:DescribeNodegroup"
#         ]
#         Resource = "*"
#       },
#       {
#         Effect = "Allow"
#         Action = [
#           "autoscaling:SetDesiredCapacity",
#           "autoscaling:TerminateInstanceInAutoScalingGroup"
#         ]
#         Resource = "*"
#       }
#     ]
#   })
# }

# # Helm Release for Cluster Autoscaler
# resource "helm_release" "cluster_autoscaler" {
#   name       = "cluster-autoscaler"
#   repository = "https://kubernetes.github.io/autoscaler"
#   chart      = "cluster-autoscaler"
#   namespace  = "kube-system"
#   version    = "9.29.3"

#   set = [
#     {
#       name  = "autoDiscovery.clusterName"
#       value = var.eks_cluster_name
#     },

#     {
#       name  = "awsRegion"
#       value = var.region
#     },

#     {
#       name  = "rbac.serviceAccount.create"
#       value = "true"
#     },

#     {
#       name  = "rbac.serviceAccount.name"
#       value = "cluster-autoscaler"
#     },

#     {
#       name  = "rbac.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
#       value = module.iam_assumable_role_cluster_autoscaler.this_iam_role_arn
#     },

#     {
#       name  = "extraArgs.scale-down-enabled"
#       value = "true"
#     },
#     {
#       name  = "extraArgs.skip-nodes-with-system-pods"
#       value = "false"
#     }
#   ]
#   depends_on = [
#     aws_eks_cluster.cluster,
#     aws_eks_node_group.app_node_group,
#     aws_eks_addon.vpc_cni
#   ]
# }
