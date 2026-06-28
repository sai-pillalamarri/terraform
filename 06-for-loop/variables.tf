variable "ami_id" {
  type    = string
  default = "ami-0220d79f3f480ecf5"
}


variable "instances" {
  type = map(any)
  default = {
    mongodb = {
      instance_type = "t3.micro"
      ami_id        = "ami-0220d79f3f480ecf5"

    },
    mysql = {
      instance_type = "t3.micro"
      ami_id        = "ami-0220d79f3f480ecf5"

    },
    redis = {
      instance_type = "t3.micro"
      ami_id        = "ami-0220d79f3f480ecf5"

    },
    rabbitmq = {
      instance_type = "t3.micro"
      ami_id        = "ami-0220d79f3f480ecf5"

    },
    catalogue = {
      instance_type = "t3.micro"
      ami_id        = "ami-0220d79f3f480ecf5"

    },
    user = {
      instance_type = "t3.micro"
      ami_id        = "ami-0220d79f3f480ecf5"

    },
    cart = {
      instance_type = "t3.micro"
      ami_id        = "ami-0220d79f3f480ecf5"

    },
    shipping = {
      instance_type = "t3.micro"
      ami_id        = "ami-0220d79f3f480ecf5"

    },
    payment = {
      instance_type = "t3.micro"
      ami_id        = "ami-0220d79f3f480ecf5"

    },
    dispatch = {
      instance_type = "t3.micro"
      ami_id        = "ami-0220d79f3f480ecf5"

    },
    frontend = {
      instance_type = "t3.micro"
      ami_id        = "ami-0220d79f3f480ecf5"

    }
  }

}


variable "project" {
  type    = string
  default = "roboshop"

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

variable "environment" {
  type    = string
  default = "dev"

}

variable "domain" {
  type    = string
  default = "aslearnings.online"

}

variable "zone_id" {

  default = "Z09423303UD7JE5COLBZI"

}
