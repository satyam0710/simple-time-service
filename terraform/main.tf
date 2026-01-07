module "vpc" {
  source                     = "./modules/vpc"
  name                       = "${var.name}-${var.environment}"
  region                     = var.region
  cidr_block                 = var.cidr_block
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  azs                        = var.azs
  environment                = var.environment
  tags                       = var.tags
  public_subnet_tags         = var.public_subnet_tags
  private_subnet_tags        = var.private_subnet_tags
}

module "kubernetes" {
  source                                 = "./modules/kubernetes"
  name                                   = var.name
  vpc_id                                 = module.vpc.id
  subnet_ids                             = module.vpc.private_subnet_ids
  environment                            = var.environment
  eks_cluster_name                       = var.eks_cluster_name
  vpc_cni_version                        = var.vpc_cni_version
  coredns_version                        = var.coredns_version
  kube_proxy_version                     = var.kube_proxy_version
  app_node_group_ami_type                = var.app_node_group_ami_type
  app_node_group_instance_type           = var.app_node_group_instance_type
  app_node_group_capacity_type           = var.app_node_group_capacity_type
  app_node_group_disk_size               = var.app_node_group_disk_size
  app_node_group_desired                 = var.app_node_group_desired
  app_node_group_max                     = var.app_node_group_max
  app_node_group_min                     = var.app_node_group_min
  aws_load_balancer_controller_ecr_image = var.aws_load_balancer_controller_ecr_image
}
