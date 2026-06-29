
variable "instance_type" {

  type    = string
  default = "t3.micro"

  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium", "t3.large"], var.instance_type)
    error_message = "instance type should be either t3.micro or t3.small or t3.medium or t3.large"
  }

}

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

variable "sg_tags" {
  type = map(any)
  default = {
    Name        = "allow-terraform-state"
    project     = "roboshop"
    environment = "dev"
  }
}

variable "port" {
  type    = number
  default = 0

}

variable "cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]

}

variable "test" {
  default = "default"

}
