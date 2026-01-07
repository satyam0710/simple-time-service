# IAM Role for EBS CSI Driver
module "iam_assumable_role_with_oidc_ebs_csi_driver" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "~> 3.0"

  create_role = true
  role_name   = "ebs-csi-driver-role-${var.environment}"

  tags = {
    Role = "ebs-csi-driver-role-${var.environment}"
  }

  provider_url = replace(aws_iam_openid_connect_provider.eks.url, "https://", "")

  role_policy_arns = [
    data.aws_iam_policy.ebs_csi_driver_policy.arn
  ]

  number_of_role_policy_arns = 1

  oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:ebs-csi-controller-sa"]
}

data "aws_iam_policy" "ebs_csi_driver_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

