# General
name        = "demo-app"
environment = "staging"
region      = "us-east-1"

# VPC
cidr_block                 = "10.0.0.0/16"
public_subnet_cidr_blocks  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
private_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
azs                        = ["us-east-1a", "us-east-1b", "us-east-1c"]
tags                       = {}
public_subnet_tags = {
  "kubernetes.io/role/elb"                         = "1"
  "kubernetes.io/cluster/demo-app-cluster-staging" = "shared"
}
private_subnet_tags = {
  "kubernetes.io/role/internal-elb"                = "1"
  "kubernetes.io/cluster/demo-app-cluster-staging" = "shared"
}

# EKS
eks_cluster_name = "demo-app-cluster-staging"

app_node_group_ami_type      = "AL2023_x86_64_STANDARD"
app_node_group_instance_type = ["t3.small"]
app_node_group_capacity_type = "ON_DEMAND"
app_node_group_disk_size     = 20
app_node_group_desired       = 3
app_node_group_max           = 3
app_node_group_min           = 1

aws_load_balancer_controller_ecr_image = "602401143452.dkr.ecr.us-west-2.amazonaws.com/amazon/aws-load-balancer-controller"
