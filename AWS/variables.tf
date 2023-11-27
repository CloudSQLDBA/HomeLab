variable "aws_region" {
  default     = "us-east-1"
}

variable "db_username" {
  description   = "Database master user"
  type          = string
  sensitive     = false
  default       = "awsadmin"
}

variable "db_password" {
  description   = "Database master user password"
  type          = string
  sensitive     = false
  default       = ""
}

variable "access_key" {
  description   = "Database master user"
  type          = string
  sensitive     = false
  default       = ""
}

variable "secret_key" {
  description   = "Database master user"
  type          = string
  sensitive     = false
  default       = ""
}