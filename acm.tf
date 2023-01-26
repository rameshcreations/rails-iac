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

resource "aws_route53_record" "dvo" {
  for_each = {
    for dvo in module.acm.acm_certificate_domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.zone.zone_id
  depends_on = [
    module.acm
  ]
}

resource "aws_acm_certificate_validation" "this" {
  certificate_arn         = module.acm.acm_certificate_arn
  validation_record_fqdns = [for record in aws_route53_record.dvo : record.fqdn]
}
