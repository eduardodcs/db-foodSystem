output "rds_hostname" {
  description = "RDS instance hostname fiap"
  value       = aws_db_instance.tech-challenge.address
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.tech-challenge.port
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.tech-challenge.username
  sensitive   = true
}