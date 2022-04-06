variable "db_name" {
  type = string
  default = "myDB"
}

variable "allocated_storage" {
    type = number
  default   = 10
}

variable "user_name" {
  default = "admin"
}

variable "security_group_id" {
  default = "default"
}