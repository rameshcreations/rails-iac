resource "aws_secretsmanager_secret" "redis" {
  name        = "${local.name}-redis"
  description = "Redis"
  kms_key_id  = module.kms.key_arn
}

resource "aws_secretsmanager_secret_version" "redis" {
  secret_id = aws_secretsmanager_secret.redis.id
  secret_string = jsonencode(
    {
      auth_token             = module.redis.password
      port                   = 6379
    }
  )
}