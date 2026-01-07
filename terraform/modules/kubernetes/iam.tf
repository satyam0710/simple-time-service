data "aws_iam_policy" "eks_cluster_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

data "aws_iam_policy" "eks_worker_node_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

data "aws_iam_policy" "eks_cni_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

data "aws_iam_policy" "ecr_read_only_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

# IAM Role for cluster
resource "aws_iam_role" "cluster_role" {

  name               = "${var.name}-cluster-role-${var.environment}"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# Attach the AmazonEKSClusterPolicy to the IAM role
resource "aws_iam_role_policy_attachment" "eks_cluster_role_policy_attachment" {
  policy_arn = data.aws_iam_policy.eks_cluster_policy.arn
  role       = aws_iam_role.cluster_role.name
}


# Define an IAM role for EKS worker nodes
resource "aws_iam_role" "node_role" {

  name = "${var.name}-node-role-${var.environment}"
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

# Attach policies to the IAM role for EKS worker nodes
resource "aws_iam_role_policy_attachment" "eks_worker_role_policy_attachment" {
  policy_arn = data.aws_iam_policy.eks_worker_node_policy.arn
  role       = aws_iam_role.node_role.name
}

resource "aws_iam_role_policy_attachment" "eks_cni_role_policy_attachment" {
  policy_arn = data.aws_iam_policy.eks_cni_policy.arn
  role       = aws_iam_role.node_role.name
}

resource "aws_iam_role_policy_attachment" "ecr_read_only_role_policy_attachment" {
  policy_arn = data.aws_iam_policy.ecr_read_only_policy.arn
  role       = aws_iam_role.node_role.name
}
