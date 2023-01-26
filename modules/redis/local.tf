locals {
  config_vars = {
    architecture   = var.module_architecture
    redis_password = random_password.redis_pass.result
    extra_flags    = var.extra_flags
  }
  redis_values = templatefile("${path.module}/data/template-values.yaml", local.config_vars)
}