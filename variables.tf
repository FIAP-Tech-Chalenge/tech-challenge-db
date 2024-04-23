variable "aws_access_key_id" {
  type        = string
  description = "AWS access key ID"
  sensitive   = true
}

variable "aws_secret_access_key" {
  type        = string
  description = "AWS secret access key"
  sensitive   = true
}

variable "vpc_id" {
  type        = string
  description = "O ID da VPC onde os recursos serão criados."
}

variable "access_cidr_block" {
  type        = string
  description = "CIDR block permitido para acesso ao RDS."
  default     = "0.0.0.0/0"
}

variable "master_username" {
  type        = string
  description = "O nome de usuário administrador do banco de dados."
}

variable "db_password" {
  type        = string
  description = "A senha do banco de dados."
  sensitive   = true
}
