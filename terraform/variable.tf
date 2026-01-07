# General Variables
variable "name" {
  default     = "demo-app"
  type        = string
  description = "Stack Name"
}

variable "environment" {
  type        = string
  description = "Name of environment"
}

variable "region" {
  default     = "us-east-1"
  type        = string
  description = "Region of the VPC"
}

# VPC Variables
variable "cidr_block" {
  default     = "10.0.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  default     = ["10.0.0.0/24", "10.0.2.0/24"]
  type        = list(any)
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidr_blocks" {
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
  type        = list(any)
  description = "List of private subnet CIDR blocks"
}

variable "public_subnet_tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the Public subnets"
}

variable "private_subnet_tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the Private subnets"
}

variable "azs" {
  default     = ["us-east-1a", "us-east-1b"]
  type        = list(any)
  description = "List of availability zones"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the VPC resources"
}

# EKS Variables
variable "eks_cluster_name" {
  description = "Name for the EKS cluster"
  type        = string
  default     = "development-eks"
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

variable "aws_load_balancer_controller_ecr_image" {
  description = "AWS LoadBalancer controller ECR Image"
  type        = string
  default     = ""
}

# App Node Group Variables
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
