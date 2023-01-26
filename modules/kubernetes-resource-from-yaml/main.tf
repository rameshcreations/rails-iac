terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

resource "kubectl_manifest" "this" {
  yaml_body          = var.resource_definition
  force_new          = var.force_new
  override_namespace = var.override_namespace
  sensitive_fields   = var.sensitive_fields
  wait               = var.wait
  wait_for_rollout   = var.wait_for_rollout
}