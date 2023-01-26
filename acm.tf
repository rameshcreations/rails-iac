module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "4.3.2"

  wait_for_validation  = false
  validate_certificate = true
  domain_name          = var.domain_name
  zone_id              = data.aws_route53_zone.zone.zone_id
  subject_alternative_names = [
    "*.${var.domain_name}",
    var.domain_name
  ]
}
