variable "environment" {
  description = "Environment of deployment"
  type = string
}

variable "key_path" {
  description = "Key path for the .pub"
  type = string
}

variable "instances" {
  description = "To implement for_Each and handle indexing"
  type = map(string)
}

variable "subnet_id" {
  description = "Input from network module"
  type = string
}

variable "sg_id" {
  description = "Accept SG_ID from security module"
  type = string
}



