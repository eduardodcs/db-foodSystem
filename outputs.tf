output "rds_hostname" {
  description = "RDS instance hostname fiap"
  value       = aws_db_instance.food-system.address
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.food-system.port
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.food-system.username
  sensitive   = true
}