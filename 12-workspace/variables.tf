variable "project_name" {
  type    = string
  default = "roboshop"
}

variable "instance_types" {

  type = map(any)
  default = {
    dev  = "t3.micro",
    prod = "t3.small"

  }

}


