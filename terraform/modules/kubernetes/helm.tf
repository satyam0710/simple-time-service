# Metrics server can be deployed separately if needed
# Commented out due to Helm provider configuration complexity in modules
#
# resource "helm_release" "metrics_server" {
#   name       = "metrics-server"
#   repository = "https://kubernetes-sigs.github.io/metrics-server/"
#   chart      = "metrics-server"
#   version    = "3.11.0"
#   namespace  = "kube-system"
#   depends_on = [
#     aws_eks_cluster.cluster,
#     aws_eks_node_group.app_node_group
#   ]
# }
