variable "ami_id" {
  type    = string
  default = "ami-0220d79f3f480ecf5"
}

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
  default = "allow-terraform"

}

variable "sg_tags" {
  type = map(any)
  default = {
    Name        = "allow-terraform"
    project     = "roboshop"
    environment = "dev"
  }
}

variable "ingress_rules" {
  type = map(any)
  default = {
    ssh = {
      from_port = 22
      to_port   = 22

    },
    http = {
      from_port = 8080
      to_port   = 8080

    }

  }

}


