# # AWS Load Balancer Controller
# # This deploys the AWS Load Balancer Controller which manages ALB/NLB for Kubernetes Ingress/Service resources

# # IAM Role for AWS Load Balancer Controller
# module "iam_assumable_role_with_oidc_aws_loadbalancer_controller" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
#   version = "~> 3.0"

#   create_role = true
#   role_name   = "${var.name}-aws-lb-controller-role-${var.environment}"

#   tags = {
#     Role = "${var.name}-aws-lb-controller-role-${var.environment}"
#   }

#   provider_url = replace(aws_iam_openid_connect_provider.eks.url, "https://", "")

#   role_policy_arns = [
#     aws_iam_policy.aws_load_balancer_controller.arn
#   ]

#   number_of_role_policy_arns = 1

#   oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:aws-load-balancer-controller"]
# }

# # IAM Policy for AWS Load Balancer Controller
# resource "aws_iam_policy" "aws_load_balancer_controller" {
#   name        = "${var.name}-aws-lb-controller-policy-${var.environment}"
#   path        = "/"
#   description = "IAM policy for AWS Load Balancer Controller"
#   policy      = file("${path.module}/files/AWSLoadBalancerControllerIAMPolicy.json")
# }

# # Helm Release for AWS Load Balancer Controller
# resource "helm_release" "aws_load_balancer_controller" {
#   name       = "aws-load-balancer-controller"
#   repository = "https://aws.github.io/eks-charts"
#   chart      = "aws-load-balancer-controller"
#   namespace  = "kube-system"
#   version    = "1.6.2"

#   set = [
#     {
#       name  = "clusterName"
#       value = var.eks_cluster_name
#     },
#     {
#       name  = "serviceAccount.create"
#       value = "true"
#     },
#     {
#       name  = "serviceAccount.name"
#       value = "aws-load-balancer-controller"
#     },
#     {
#       name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
#       value = module.iam_assumable_role_with_oidc_aws_loadbalancer_controller.this_iam_role_arn
#     },

#     {
#       name  = "region"
#       value = var.region
#     },

#     {
#       name  = "vpcId"
#       value = var.vpc_id
#     },
#   ]
#   depends_on = [
#     aws_eks_cluster.cluster,
#     aws_eks_node_group.app_node_group,
#     aws_eks_addon.vpc_cni
#   ]
# }
