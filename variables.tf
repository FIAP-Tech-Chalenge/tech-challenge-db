variable "vpc_id" {
  type        = string
  description = "O ID da VPC onde os recursos serão criados."
}

variable "access_cidr_block" {
  type        = string
  description = "CIDR block permitido para acesso ao RDS."
  default     = "0.0.0.0/0"
}
