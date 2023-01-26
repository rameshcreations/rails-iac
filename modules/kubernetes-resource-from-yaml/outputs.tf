output "api_version" {
  value       = kubectl_manifest.this.api_version
  description = "Kubernetes API version that offers the resource"
}

output "kind" {
  value       = kubectl_manifest.this.kind
  description = "Kubernetes resource's Kind"
}

output "name" {
  value       = kubectl_manifest.this.name
  description = "Name of the resource"
}

output "namespace" {
  value       = kubectl_manifest.this.namespace
  description = "Namespace in which the resource is created"
}