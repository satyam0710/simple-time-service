# kubernetes

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

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.47 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.7 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | >= 1.14 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.0.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_assumable_role_cluster_autoscaler"></a> [iam\_assumable\_role\_cluster\_autoscaler](#module\_iam\_assumable\_role\_cluster\_autoscaler) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | ~> 4.0 |
| <a name="module_iam_assumable_role_with_oidc_aws_loadbalancer_controller"></a> [iam\_assumable\_role\_with\_oidc\_aws\_loadbalancer\_controller](#module\_iam\_assumable\_role\_with\_oidc\_aws\_loadbalancer\_controller) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | ~> 3.0 |
| <a name="module_iam_assumable_role_with_oidc_ebs_csi_driver"></a> [iam\_assumable\_role\_with\_oidc\_ebs\_csi\_driver](#module\_iam\_assumable\_role\_with\_oidc\_ebs\_csi\_driver) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | ~> 3.0 |
| <a name="module_iam_assumable_role_with_oidc_eso"></a> [iam\_assumable\_role\_with\_oidc\_eso](#module\_iam\_assumable\_role\_with\_oidc\_eso) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | ~> 3.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eks_addon.aws_ebs_csi_driver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.coredns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.kube_proxy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.vpc_cni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.app_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_eks_node_group.github_runner_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_openid_connect_provider.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.aws_load_balancer_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.external_secret_reader](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.cluster_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.node_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecr_read_only_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_cluster_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_cni_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_worker_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [helm_release.aws_load_balancer_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.external_secrets_operator](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.kube_prometheus](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.metrics_server](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.secrets_reloader](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.secret_store](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_config_map.aws_auth](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |
| [kubernetes_default_service_account.external_secrets_operator](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/default_service_account) | resource |
| [kubernetes_namespace.demo_app_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy.ebs_csi_driver_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.ecr_read_only_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.eks_cluster_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.eks_cni_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.eks_worker_node_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy_document.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [tls_certificate.eks](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_node_group_ami_type"></a> [app\_node\_group\_ami\_type](#input\_app\_node\_group\_ami\_type) | ami-type of the ec2 which acts as as worker node | `string` | `"AL2023_x86_64"` | no |
| <a name="input_app_node_group_capacity_type"></a> [app\_node\_group\_capacity\_type](#input\_app\_node\_group\_capacity\_type) | Capacity type required | `string` | `"ON_DEMAND"` | no |
| <a name="input_app_node_group_desired"></a> [app\_node\_group\_desired](#input\_app\_node\_group\_desired) | Desired number of nodes in the node group | `number` | `1` | no |
| <a name="input_app_node_group_disk_size"></a> [app\_node\_group\_disk\_size](#input\_app\_node\_group\_disk\_size) | disk size reuired for the worker nodes | `number` | `20` | no |
| <a name="input_app_node_group_instance_type"></a> [app\_node\_group\_instance\_type](#input\_app\_node\_group\_instance\_type) | List of EC2 instance types for the node group | `list(string)` | <pre>[<br>  "t3.small"<br>]</pre> | no |
| <a name="input_app_node_group_max"></a> [app\_node\_group\_max](#input\_app\_node\_group\_max) | Maximum number of nodes in the node group | `number` | `3` | no |
| <a name="input_app_node_group_min"></a> [app\_node\_group\_min](#input\_app\_node\_group\_min) | Minimum number of nodes in the node group | `number` | `1` | no |
| <a name="input_app_node_group_name"></a> [app\_node\_group\_name](#input\_app\_node\_group\_name) | The name of the EKS node group | `string` | `"demo-app-node-group"` | no |
| <a name="input_aws_ebs_csi_driver_version"></a> [aws\_ebs\_csi\_driver\_version](#input\_aws\_ebs\_csi\_driver\_version) | AWS EBS CSI Driver  addon version | `string` | `"v1.28.0-eksbuild.1"` | no |
| <a name="input_aws_load_balancer_controller_ecr_image"></a> [aws\_load\_balancer\_controller\_ecr\_image](#input\_aws\_load\_balancer\_controller\_ecr\_image) | AWS LoadBalancer controller ECR Image | `string` | `""` | no |
| <a name="input_coredns_version"></a> [coredns\_version](#input\_coredns\_version) | CoreDNS addon version | `string` | `"v1.11.1-eksbuild.6"` | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | Name for the EKS cluster | `string` | `"development-eks-cluster"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of environment this VPC is targeting | `string` | n/a | yes |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name for the IAM role used by EKS | `string` | `"eks-cluster-demo"` | no |
| <a name="input_image_tag_version"></a> [image\_tag\_version](#input\_image\_tag\_version) | AWS LoadBalancer controller imager tag version | `string` | `"v2.4.2"` | no |
| <a name="input_kube_proxy_version"></a> [kube\_proxy\_version](#input\_kube\_proxy\_version) | Kube Proxy addon version | `string` | `"v1.28.4-eksbuild.4"` | no |
| <a name="input_name"></a> [name](#input\_name) | Stack name | `string` | `"Default"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region of the VPC | `string` | `"us-east-1"` | no |
| <a name="input_runner_node_group_ami_type"></a> [runner\_node\_group\_ami\_type](#input\_runner\_node\_group\_ami\_type) | ami-type of the ec2 which acts as as worker node | `string` | `"AL2023_x86_64"` | no |
| <a name="input_runner_node_group_capacity_type"></a> [runner\_node\_group\_capacity\_type](#input\_runner\_node\_group\_capacity\_type) | capacity type required | `string` | `"ON_DEMAND"` | no |
| <a name="input_runner_node_group_desired"></a> [runner\_node\_group\_desired](#input\_runner\_node\_group\_desired) | number of worker node required | `number` | `1` | no |
| <a name="input_runner_node_group_disk_size"></a> [runner\_node\_group\_disk\_size](#input\_runner\_node\_group\_disk\_size) | disk size reuired for the worker nodes | `number` | `20` | no |
| <a name="input_runner_node_group_instance_type"></a> [runner\_node\_group\_instance\_type](#input\_runner\_node\_group\_instance\_type) | instance type of ec2 which acts as a worker nodes | `list(string)` | <pre>[<br>  "t3.small"<br>]</pre> | no |
| <a name="input_runner_node_group_max"></a> [runner\_node\_group\_max](#input\_runner\_node\_group\_max) | maximum number of worker node required | `number` | `1` | no |
| <a name="input_runner_node_group_min"></a> [runner\_node\_group\_min](#input\_runner\_node\_group\_min) | mininum number of worker node required | `number` | `1` | no |
| <a name="input_runner_node_group_name"></a> [runner\_node\_group\_name](#input\_runner\_node\_group\_name) | The name of the EKS node group | `string` | `"demo-github-runner-node-group"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Configuration for the node group VPC | `any` | n/a | yes |
| <a name="input_vpc_cni_version"></a> [vpc\_cni\_version](#input\_vpc\_cni\_version) | VPC CNI addon version | `string` | `"v1.16.0-eksbuild.1"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Configuration for the node group VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
| <a name="output_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#output\_cluster\_oidc\_issuer\_url) | n/a |
| <a name="output_eks_cluster_certificate_authority"></a> [eks\_cluster\_certificate\_authority](#output\_eks\_cluster\_certificate\_authority) | n/a |
| <a name="output_eks_cluster_endpoint"></a> [eks\_cluster\_endpoint](#output\_eks\_cluster\_endpoint) | Endpoint of the created EKS cluster |
| <a name="output_eks_cluster_name"></a> [eks\_cluster\_name](#output\_eks\_cluster\_name) | Name of the created EKS cluster |
| <a name="output_eks_cluster_security_group_ids"></a> [eks\_cluster\_security\_group\_ids](#output\_eks\_cluster\_security\_group\_ids) | Security group IDs associated with the EKS cluster |
| <a name="output_eks_node_group_name"></a> [eks\_node\_group\_name](#output\_eks\_node\_group\_name) | Name of the created EKS node group |
| <a name="output_eks_oidc_issuer_url"></a> [eks\_oidc\_issuer\_url](#output\_eks\_oidc\_issuer\_url) | OIDC issuer URL of the EKS cluster |
| <a name="output_eks_security_group_ids"></a> [eks\_security\_group\_ids](#output\_eks\_security\_group\_ids) | n/a |
| <a name="output_node_role_arn"></a> [node\_role\_arn](#output\_node\_role\_arn) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
