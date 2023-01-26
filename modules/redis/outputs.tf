output "password" {
  value       = random_password.redis_pass.result
  description = "Default password for redis installation"
  sensitive   = true
}