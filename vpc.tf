module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name            = local.name
  cidr            = var.vpc_cidr
  azs             = var.vpc_availability_zones
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets


  create_database_subnet_group    = false
  create_elasticache_subnet_group = false
  enable_dns_hostnames            = true
  enable_dns_support              = true
  enable_nat_gateway              = true
  single_nat_gateway              = true
  one_nat_gateway_per_az          = false
  enable_vpn_gateway              = false

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.name}" = "shared"
    "kubernetes.io/role/elb"              = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.name}" = "shared"
    "kubernetes.io/role/internal-elb"     = 1
  }

  # VPC Flow Logs
  enable_flow_log                                 = true
  create_flow_log_cloudwatch_log_group            = true
  create_flow_log_cloudwatch_iam_role             = true
  flow_log_max_aggregation_interval               = 60
  flow_log_cloudwatch_log_group_retention_in_days = 365
  flow_log_cloudwatch_log_group_kms_key_id        = module.kms.key_arn
  vpc_flow_log_tags                               = { Name = "${local.name}-flow-logs" }

  public_dedicated_network_acl  = true
  private_dedicated_network_acl = true
  default_network_acl_ingress   = []
  default_network_acl_egress    = []

  manage_default_vpc            = false
  default_vpc_tags              = { Name = "${local.name}-default" }
  manage_default_network_acl    = true
  default_network_acl_tags      = { Name = "${local.name}-default" }
  manage_default_route_table    = true
  default_route_table_tags      = { Name = "${local.name}-default" }
  manage_default_security_group = true
  default_security_group_tags   = { Name = "${local.name}-default" }
}
