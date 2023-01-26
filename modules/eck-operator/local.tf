locals {
  config_vars = {
    replica_count   = var.eck_operator_replica_count
  }
  eck_values = templatefile("${path.module}/data/template-values.yaml", local.config_vars)
}