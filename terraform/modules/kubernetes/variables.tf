variable "environment" {
  type        = string
  description = "Name of environment this VPC is targeting"
}

variable "name" {
  default     = "Default"
  type        = string
  description = "Stack name"
}

variable "region" {
  default     = "us-east-1"
  type        = string
  description = "Region of the VPC"
}

variable "iam_role_name" {
  description = "Name for the IAM role used by EKS"
  type        = string
  default     = "eks-cluster-demo"
}

variable "eks_cluster_name" {
  description = "Name for the EKS cluster"
  type        = string
  default     = "development-eks-cluster"
}

variable "app_node_group_name" {
  description = "The name of the EKS node group"
  type        = string
  default     = "demo-app-node-group"
}

variable "vpc_cni_version" {
  description = "VPC CNI addon version"
  type        = string
  default     = "v1.16.0-eksbuild.1"
}

variable "coredns_version" {
  description = "CoreDNS addon version"
  type        = string
  default     = "v1.11.1-eksbuild.6"
}

variable "kube_proxy_version" {
  description = "Kube Proxy addon version"
  type        = string
  default     = "v1.28.4-eksbuild.4"
}

variable "aws_ebs_csi_driver_version" {
  description = "AWS EBS CSI Driver  addon version"
  type        = string
  default     = "v1.28.0-eksbuild.1"
}

variable "image_tag_version" {
  description = "AWS LoadBalancer controller imager tag version"
  type        = string
  default     = "v2.4.2"
}

variable "aws_load_balancer_controller_ecr_image" {
  description = "AWS LoadBalancer controller ECR Image"
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "Configuration for the node group VPC"
  type        = any
}

variable "vpc_id" {
  description = "Configuration for the node group VPC"
  type        = string
}

variable "app_node_group_instance_type" {
  description = "List of EC2 instance types for the node group"
  type        = list(string)
  default     = ["t3.small"]
}

variable "app_node_group_desired" {
  description = "Desired number of nodes in the node group"
  type        = number
  default     = 1
}

variable "app_node_group_max" {
  description = "Maximum number of nodes in the node group"
  type        = number
  default     = 3
}

variable "app_node_group_min" {
  description = "Minimum number of nodes in the node group"
  type        = number
  default     = 1
}

variable "app_node_group_ami_type" {
  type        = string
  description = "ami-type of the ec2 which acts as as worker node"
  default     = "AL2023_x86_64"
}

variable "app_node_group_capacity_type" {
  type        = string
  description = "Capacity type required"
  default     = "ON_DEMAND"
}

variable "app_node_group_disk_size" {
  type        = number
  description = "disk size reuired for the worker nodes"
  default     = 20
}
