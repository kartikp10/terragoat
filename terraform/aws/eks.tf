locals {
  eks_name = {
    value = "${local.resource_prefix.value}-eks"
  }
}

data aws_iam_policy_document "iam_policy_eks" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

resource aws_iam_role "iam_for_eks" {
  name               = "${local.resource_prefix.value}-iam-for-eks"
  assume_role_policy = data.aws_iam_policy_document.iam_policy_eks.json
  tags = {
    yor_trace = "835bf3a1-83bd-4cc6-afdb-527f4281fc4d"
  }
}

resource aws_iam_role_policy_attachment "policy_attachment-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.iam_for_eks.name
}

resource aws_iam_role_policy_attachment "policy_attachment-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.iam_for_eks.name
}

resource aws_vpc "eks_vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name      = "${local.resource_prefix.value}-eks-vpc"
    yor_trace = "51a1ec1d-4aca-4a31-9521-efb0c7615394"
  }
}

resource aws_subnet "eks_subnet1" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.10.10.0/24"
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name                                            = "${local.resource_prefix.value}-eks-subnet"
    "kubernetes.io/cluster/${local.eks_name.value}" = "shared"
    yor_trace                                       = "579a6e92-644f-4c04-9125-1b2ad558a6b2"
  }
}

resource aws_subnet "eks_subnet2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.10.11.0/24"
  availability_zone       = var.availability_zone2
  map_public_ip_on_launch = true
  tags = {
    Name                                            = "${local.resource_prefix.value}-eks-subnet2"
    "kubernetes.io/cluster/${local.eks_name.value}" = "shared"
    yor_trace                                       = "0bafb1b6-5075-4435-8e22-36d7b0b54f17"
  }
}

resource aws_eks_cluster "eks_cluster" {
  name     = local.eks_name.value
  role_arn = "${aws_iam_role.iam_for_eks.arn}"

  vpc_config {
    endpoint_private_access = true
    subnet_ids              = ["${aws_subnet.eks_subnet1.id}", "${aws_subnet.eks_subnet2.id}"]
  }

  depends_on = [
    "aws_iam_role_policy_attachment.policy_attachment-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.policy_attachment-AmazonEKSServicePolicy",
  ]
  tags = {
    yor_trace = "77c6377f-3c01-4ab0-b68a-52e00211c504"
  }
}

output "endpoint" {
  value = "${aws_eks_cluster.eks_cluster.endpoint}"
}

output "kubeconfig-certificate-authority-data" {
  value = "${aws_eks_cluster.eks_cluster.certificate_authority.0.data}"
}
