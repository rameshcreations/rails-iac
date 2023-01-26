module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "1.3.1"

  deletion_window_in_days = 7
  description             = format("aws-%s-%s", var.name, var.environment)
  key_usage               = "ENCRYPT_DECRYPT"
  multi_region            = true
  enable_key_rotation     = true
  is_enabled              = true

  # Policy
  enable_default_policy = false
  policy = templatefile("${path.module}/iam/kms.json", {
    region     = local.region
    account_id = local.account_id
    partition  = local.partition
  })

  # Aliases
  aliases                 = ["rails-aws", "master-key"]
  aliases_use_name_prefix = false
}
