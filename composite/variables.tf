variable "vpc_cidr" {
  type = string
}

variable "environment" {
  type = string
    validation {
    condition = contains(["dev","prod"],var.enviroment)
    error_message = "Lavdya prod kivha Dev taak mc"
  }
}

variable "availability_zone_tail" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "mypc" {
  type = string
}

variable "key_path" {
  type = string
}


variable "instances" {
  type = map(string)
}

variable "region" {
  type = string
}