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
    yor_trace = "bc3b599b-4fe3-481c-b7c7-7056a8270fe1"
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
    yor_trace = "af4faf9a-511c-4000-a192-780324b672e3"
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
    yor_trace                                       = "096ebb52-46f9-429a-bdf1-a432ec0e8946"
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
    yor_trace                                       = "0fb9471b-82b7-4f26-939f-232541e5cd62"
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
    yor_trace = "6bb6e8b5-0baf-4686-932f-98654f79c3e4"
  }
}

output "endpoint" {
  value = "${aws_eks_cluster.eks_cluster.endpoint}"
}

output "kubeconfig-certificate-authority-data" {
  value = "${aws_eks_cluster.eks_cluster.certificate_authority.0.data}"
}
