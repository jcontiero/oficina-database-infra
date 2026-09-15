variable "db_user" { type = string }
variable "db_password" {
  type      = string
  sensitive = true
}
variable "db_ip" { type = string }
