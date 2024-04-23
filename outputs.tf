output "security_group_id" {
  value       = aws_security_group.rds_sg.id
  description = "O ID do Security Group criado para o RDS."
}
