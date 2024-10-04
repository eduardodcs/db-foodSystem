variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "db_user" {
  type        = string
  description = "RDS user"
  default     = "systemdb_user"
}

variable "db_password" {
  description = "RDS password"
  type        = string
  default     = "1234"
}