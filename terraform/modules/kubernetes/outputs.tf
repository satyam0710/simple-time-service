output "eks_cluster_name" {
  description = "Name of the created EKS cluster"
  value       = aws_eks_cluster.cluster.name
}

output "eks_cluster_endpoint" {
  description = "Endpoint of the created EKS cluster"
  value       = aws_eks_cluster.cluster.endpoint
}

output "eks_cluster_security_group_ids" {
  description = "Security group IDs associated with the EKS cluster"
  value       = aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id
}

output "eks_oidc_issuer_url" {
  description = "OIDC issuer URL of the EKS cluster"
  value       = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}

output "eks_node_group_name" {
  description = "Name of the created EKS node group"
  value       = aws_eks_node_group.app_node_group.node_group_name
}

output "cluster_id" {
  value = aws_eks_cluster.cluster.id
}

output "cluster_oidc_issuer_url" {
  value = aws_iam_openid_connect_provider.eks.url
}

output "node_role_arn" {
  value = aws_iam_role.node_role.arn
}

output "eks_cluster_certificate_authority" {
  value = aws_eks_cluster.cluster.certificate_authority[0].data
}

output "eks_security_group_ids" {
  value = aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id
}
