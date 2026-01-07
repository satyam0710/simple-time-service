# Node Boilerplate Infrastructure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.47 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.7 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.14 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | ./modules/acm | n/a |
| <a name="module_ecr"></a> [ecr](#module\_ecr) | ./modules/ecr | n/a |
| <a name="module_github-runner"></a> [github-runner](#module\_github-runner) | ./modules/github-runner | n/a |
| <a name="module_kubernetes"></a> [kubernetes](#module\_kubernetes) | ./modules/kubernetes | n/a |
| <a name="module_rds"></a> [rds](#module\_rds) | ./modules/rds | n/a |
| <a name="module_route53"></a> [route53](#module\_route53) | ./modules/route53 | n/a |
| <a name="module_secrets-manager"></a> [secrets-manager](#module\_secrets-manager) | ./modules/secrets-manager | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_aws_lb_url"></a> [app\_aws\_lb\_url](#input\_app\_aws\_lb\_url) | AWS Loadbalancer endpoint | `string` | `""` | no |
| <a name="input_app_domain"></a> [app\_domain](#input\_app\_domain) | App domain name | `string` | `"app.clouddemo.top"` | no |
| <a name="input_app_node_group_ami_type"></a> [app\_node\_group\_ami\_type](#input\_app\_node\_group\_ami\_type) | ami-type of the ec2 which acts as as worker node | `string` | `"AL2023_x86_64"` | no |
| <a name="input_app_node_group_capacity_type"></a> [app\_node\_group\_capacity\_type](#input\_app\_node\_group\_capacity\_type) | Capacity type required | `string` | `"ON_DEMAND"` | no |
| <a name="input_app_node_group_desired"></a> [app\_node\_group\_desired](#input\_app\_node\_group\_desired) | Desired number of nodes in the node group | `number` | `1` | no |
| <a name="input_app_node_group_disk_size"></a> [app\_node\_group\_disk\_size](#input\_app\_node\_group\_disk\_size) | disk size reuired for the worker nodes | `number` | `20` | no |
| <a name="input_app_node_group_instance_type"></a> [app\_node\_group\_instance\_type](#input\_app\_node\_group\_instance\_type) | List of EC2 instance types for the node group | `list(string)` | <pre>[<br>  "t3.small"<br>]</pre> | no |
| <a name="input_app_node_group_max"></a> [app\_node\_group\_max](#input\_app\_node\_group\_max) | Maximum number of nodes in the node group | `number` | `3` | no |
| <a name="input_app_node_group_min"></a> [app\_node\_group\_min](#input\_app\_node\_group\_min) | Minimum number of nodes in the node group | `number` | `1` | no |
| <a name="input_app_node_group_name"></a> [app\_node\_group\_name](#input\_app\_node\_group\_name) | The name of the EKS node group | `string` | `"demo-app-node-group"` | no |
| <a name="input_auth_create"></a> [auth\_create](#input\_auth\_create) | it allow us to create secret or not | `string` | `"authSecret.create"` | no |
| <a name="input_auth_create_or_not"></a> [auth\_create\_or\_not](#input\_auth\_create\_or\_not) | it will create secret after enabling it otherwise it will not create secret | `bool` | `true` | no |
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | authorization type | `string` | `"authSecret.github_token"` | no |
| <a name="input_aws_ebs_csi_driver_version"></a> [aws\_ebs\_csi\_driver\_version](#input\_aws\_ebs\_csi\_driver\_version) | AWS EBS CSI Driver addon version | `string` | `"v1.28.0-eksbuild.1"` | no |
| <a name="input_aws_load_balancer_controller_ecr_image"></a> [aws\_load\_balancer\_controller\_ecr\_image](#input\_aws\_load\_balancer\_controller\_ecr\_image) | AWS LoadBalancer controller ECR Image | `string` | `""` | no |
| <a name="input_azs"></a> [azs](#input\_azs) | List of availability zones | `list(any)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b"<br>]</pre> | no |
| <a name="input_cert_chart_name"></a> [cert\_chart\_name](#input\_cert\_chart\_name) | chart name | `string` | `"cert-manager"` | no |
| <a name="input_cert_namespace"></a> [cert\_namespace](#input\_cert\_namespace) | namespace in which cert-manager is working | `string` | `"cert-manager"` | no |
| <a name="input_cert_release_name"></a> [cert\_release\_name](#input\_cert\_release\_name) | release name of cert-manager | `string` | `"cert-release"` | no |
| <a name="input_cert_repository_name"></a> [cert\_repository\_name](#input\_cert\_repository\_name) | repository name of cert-manager | `string` | `"https://charts.jetstack.io"` | no |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | CIDR block for the VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_coredns_version"></a> [coredns\_version](#input\_coredns\_version) | CoreDNS addon version | `string` | `"v1.11.1-eksbuild.6"` | no |
| <a name="input_create_db_cluster_activity_stream"></a> [create\_db\_cluster\_activity\_stream](#input\_create\_db\_cluster\_activity\_stream) | n/a | `bool` | `false` | no |
| <a name="input_create_db_cluster_parameter_group"></a> [create\_db\_cluster\_parameter\_group](#input\_create\_db\_cluster\_parameter\_group) | n/a | `bool` | `true` | no |
| <a name="input_create_db_parameter_group"></a> [create\_db\_parameter\_group](#input\_create\_db\_parameter\_group) | n/a | `bool` | `true` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | enabling namespace | `bool` | `true` | no |
| <a name="input_custom_resource_definition"></a> [custom\_resource\_definition](#input\_custom\_resource\_definition) | custom reourec definition | `string` | `"installCRDs"` | no |
| <a name="input_db_autoscaling_enabled"></a> [db\_autoscaling\_enabled](#input\_db\_autoscaling\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_db_autoscaling_max_capacity"></a> [db\_autoscaling\_max\_capacity](#input\_db\_autoscaling\_max\_capacity) | n/a | `number` | `2` | no |
| <a name="input_db_autoscaling_min_capacity"></a> [db\_autoscaling\_min\_capacity](#input\_db\_autoscaling\_min\_capacity) | n/a | `number` | `1` | no |
| <a name="input_db_autoscaling_target_cpu"></a> [db\_autoscaling\_target\_cpu](#input\_db\_autoscaling\_target\_cpu) | n/a | `number` | `70` | no |
| <a name="input_db_backup_retention_period"></a> [db\_backup\_retention\_period](#input\_db\_backup\_retention\_period) | n/a | `number` | `7` | no |
| <a name="input_db_cluster_identifier"></a> [db\_cluster\_identifier](#input\_db\_cluster\_identifier) | n/a | `string` | `"demo-app"` | no |
| <a name="input_db_cluster_parameter_group_name"></a> [db\_cluster\_parameter\_group\_name](#input\_db\_cluster\_parameter\_group\_name) | n/a | `string` | `"dbc-parameter"` | no |
| <a name="input_db_debug_logging"></a> [db\_debug\_logging](#input\_db\_debug\_logging) | n/a | `bool` | `true` | no |
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | RDS | `string` | `"aurora-mysql"` | no |
| <a name="input_db_engine_family"></a> [db\_engine\_family](#input\_db\_engine\_family) | n/a | `string` | `"MYSQL"` | no |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | n/a | `string` | `"8.0"` | no |
| <a name="input_db_host"></a> [db\_host](#input\_db\_host) | The database cluster endpoint | `string` | n/a | yes |
| <a name="input_db_iam_database_authentication_enabled"></a> [db\_iam\_database\_authentication\_enabled](#input\_db\_iam\_database\_authentication\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_db_iam_role_name"></a> [db\_iam\_role\_name](#input\_db\_iam\_role\_name) | n/a | `string` | `"proxyrole"` | no |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | n/a | `string` | `"db.t3.medium"` | no |
| <a name="input_db_manage_master_user_password"></a> [db\_manage\_master\_user\_password](#input\_db\_manage\_master\_user\_password) | n/a | `bool` | `false` | no |
| <a name="input_db_manage_master_user_password_rotation"></a> [db\_manage\_master\_user\_password\_rotation](#input\_db\_manage\_master\_user\_password\_rotation) | n/a | `bool` | `false` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The database name | `string` | n/a | yes |
| <a name="input_db_parameter_group_name"></a> [db\_parameter\_group\_name](#input\_db\_parameter\_group\_name) | n/a | `string` | `"dbp-group"` | no |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | The database password | `string` | n/a | yes |
| <a name="input_db_port"></a> [db\_port](#input\_db\_port) | The database port | `string` | n/a | yes |
| <a name="input_db_preferred_backup_window"></a> [db\_preferred\_backup\_window](#input\_db\_preferred\_backup\_window) | The daily time range during which automated backups are created if automated backups are enabled using the `backup_retention_period` parameter. Time in UTC | `string` | `"02:00-03:00"` | no |
| <a name="input_db_proxy_name"></a> [db\_proxy\_name](#input\_db\_proxy\_name) | n/a | `string` | `"rds-proxy"` | no |
| <a name="input_db_publicly_accessible"></a> [db\_publicly\_accessible](#input\_db\_publicly\_accessible) | n/a | `bool` | `true` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | n/a | `string` | `"rds-subnet-group"` | no |
| <a name="input_db_target_role"></a> [db\_target\_role](#input\_db\_target\_role) | n/a | `string` | `"READ_ONLY"` | no |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | The username for the database | `string` | n/a | yes |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | Name for the EKS cluster | `string` | `"development-eks"` | no |
| <a name="input_enable_crd"></a> [enable\_crd](#input\_enable\_crd) | install crd yes or no | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of environment | `string` | n/a | yes |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | github personal access token | `string` | n/a | yes |
| <a name="input_grafana_app_aws_lb_url"></a> [grafana\_app\_aws\_lb\_url](#input\_grafana\_app\_aws\_lb\_url) | Grafana AWS Loadbalancer endpoint | `string` | `""` | no |
| <a name="input_grafana_domain"></a> [grafana\_domain](#input\_grafana\_domain) | grafana domain name | `string` | `"grafana.clouddemo.top"` | no |
| <a name="input_hosted_zone_name"></a> [hosted\_zone\_name](#input\_hosted\_zone\_name) | Route53 hosted zone name | `string` | `"clouddemo.top"` | no |
| <a name="input_image_tag_version"></a> [image\_tag\_version](#input\_image\_tag\_version) | AWS LoadBalancer controller imager tag version | `string` | `"v2.4.2"` | no |
| <a name="input_kube_proxy_version"></a> [kube\_proxy\_version](#input\_kube\_proxy\_version) | Kube Proxy addon version | `string` | `"v1.28.4-eksbuild.4"` | no |
| <a name="input_name"></a> [name](#input\_name) | Stack Name | `string` | `"demo-app"` | no |
| <a name="input_private_subnet_cidr_blocks"></a> [private\_subnet\_cidr\_blocks](#input\_private\_subnet\_cidr\_blocks) | List of private subnet CIDR blocks | `list(any)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.3.0/24"<br>]</pre> | no |
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | Configuration for the node group VPC | `any` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_private_subnet_tags"></a> [private\_subnet\_tags](#input\_private\_subnet\_tags) | Extra tags to attach to the Private subnets | `map(string)` | `{}` | no |
| <a name="input_public_subnet_cidr_blocks"></a> [public\_subnet\_cidr\_blocks](#input\_public\_subnet\_cidr\_blocks) | List of public subnet CIDR blocks | `list(any)` | <pre>[<br>  "10.0.0.0/24",<br>  "10.0.2.0/24"<br>]</pre> | no |
| <a name="input_public_subnet_tags"></a> [public\_subnet\_tags](#input\_public\_subnet\_tags) | Extra tags to attach to the Public subnets | `map(string)` | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | Region of the VPC | `string` | `"us-east-1"` | no |
| <a name="input_runner_chart_name"></a> [runner\_chart\_name](#input\_runner\_chart\_name) | chart name of action-runner-controller | `string` | `"actions-runner-controller"` | no |
| <a name="input_runner_namespace"></a> [runner\_namespace](#input\_runner\_namespace) | namespace in which arc is working | `string` | `"actions-runner-system"` | no |
| <a name="input_runner_node_group_ami_type"></a> [runner\_node\_group\_ami\_type](#input\_runner\_node\_group\_ami\_type) | ami-type of the ec2 which acts as as worker node | `string` | `"AL2023_x86_64"` | no |
| <a name="input_runner_node_group_capacity_type"></a> [runner\_node\_group\_capacity\_type](#input\_runner\_node\_group\_capacity\_type) | capacity type required | `string` | `"ON_DEMAND"` | no |
| <a name="input_runner_node_group_desired"></a> [runner\_node\_group\_desired](#input\_runner\_node\_group\_desired) | number of worker node required | `number` | `1` | no |
| <a name="input_runner_node_group_disk_size"></a> [runner\_node\_group\_disk\_size](#input\_runner\_node\_group\_disk\_size) | disk size reuired for the worker nodes | `number` | `20` | no |
| <a name="input_runner_node_group_instance_type"></a> [runner\_node\_group\_instance\_type](#input\_runner\_node\_group\_instance\_type) | instance type of ec2 which acts as a worker nodes | `list(string)` | <pre>[<br>  "t3.small"<br>]</pre> | no |
| <a name="input_runner_node_group_max"></a> [runner\_node\_group\_max](#input\_runner\_node\_group\_max) | maximum number of worker node required | `number` | `1` | no |
| <a name="input_runner_node_group_min"></a> [runner\_node\_group\_min](#input\_runner\_node\_group\_min) | mininum number of worker node required | `number` | `1` | no |
| <a name="input_runner_node_group_name"></a> [runner\_node\_group\_name](#input\_runner\_node\_group\_name) | The name of the EKS node group | `string` | `"demo-github-runner-node-group"` | no |
| <a name="input_runner_release_name"></a> [runner\_release\_name](#input\_runner\_release\_name) | runner release name for action runner controller | `string` | `"arc"` | no |
| <a name="input_runner_repo_name"></a> [runner\_repo\_name](#input\_runner\_repo\_name) | runner repo where chart is going to be installed | `string` | `"https://actions-runner-controller.github.io/actions-runner-controller"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Extra tags to attach to the VPC resources | `map(string)` | `{}` | no |
| <a name="input_target_db_cluster"></a> [target\_db\_cluster](#input\_target\_db\_cluster) | n/a | `bool` | `true` | no |
| <a name="input_vpc_cni_version"></a> [vpc\_cni\_version](#input\_vpc\_cni\_version) | VPC CNI addon version | `string` | `"v1.16.0-eksbuild.1"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
