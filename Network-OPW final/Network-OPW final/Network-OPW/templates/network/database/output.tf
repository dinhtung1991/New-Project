output "endpoint" {
  description = "Endpoint for the RDS instance"
  value       = aws_db_instance.rds_mysql.endpoint
}

output "port" {
  description = "Port for the RDS instance"
  value       = aws_db_instance.rds_mysql.port
}

output "username" {
  description = "Username for the RDS instance"
  value       = aws_db_instance.rds_mysql.username
}

output "password" {
  description = "Password for the RDS instance"
  value       = aws_db_instance.rds_mysql.password
}
