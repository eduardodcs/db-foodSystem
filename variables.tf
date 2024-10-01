variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "db_user" {
  type        = string
  description = "RDS user"
  default     = "tech"
}

variable "db_password" {
  description = "RDS password"
  type        = string
  default     = "tech_passwd"
}