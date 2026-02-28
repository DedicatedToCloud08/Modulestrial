variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type = string
}

variable "environment" {
  description = "Environment of deployment"
  type = string
}

variable "availability_zone_tail" {
  description = "Just mention a b or c..."
  type = string
  validation {
    condition = contains(["a","b","c","d"],var.availability_zone_tail)
    error_message = "Please enter value 'a'/'b'/'c'/'d'"
  }
}

variable "subnet_cidr" {
 description = "The subnet CIDR"
 type = string
}

variable "region" {
  description = "region"
  type = string
}
