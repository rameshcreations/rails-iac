locals {
  account_id        = data.aws_caller_identity.current.account_id
  region            = data.aws_region.current.name
  partition         = data.aws_partition.current.partition
  name              = format("%s-%s", var.name, var.environment)
  elastic_namespace = "elastic"

  elastic_cluster_deployment_vars = {
    name      = "elastic-cluster"
  }

  elastic_cluster_deployment_yaml = templatefile("./yaml-templates/cluster.yaml", local.elastic_cluster_deployment_vars)
}


