data "aws_default_tags" "current" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_partition" "current" {}

data "aws_iam_policy" "eks_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

data "aws_route53_zone" "zone" {
  name         = var.domain_name
  private_zone = false
}
