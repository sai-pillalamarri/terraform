
variable "instance_tags" {
  type = map(any)
  default = {
    Name        = "roboshop-frontend"
    project     = "roboshop"
    environment = "dev"
  }

}

variable "security_group_name" {
  type    = string
  default = "allow-terraform-state"

}



variable "port" {
  type    = number
  default = 0

}

variable "cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]

}


variable "environment" {

  type    = string
  default = "dev"

}
