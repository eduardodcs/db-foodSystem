output "rds_hostname" {
  description = "RDS instance hostname fiap"
  value       = aws_db_instance.foodsystem.address
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.foodsystem.port
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.foodSystem.username
  sensitive   = true
}