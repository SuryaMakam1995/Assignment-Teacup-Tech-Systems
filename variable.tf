# vpc variables
variable "cidr_block" {
  description = "cidr block to be used to create the vpc"
  default = "10.0.0.0/16"
}

variable "env" {
  description = "name of the enviroment (example: prod, dev)"
}

variable "cidr_1" {
    default = "10.0.1.0/24"
}

variable "cidr_2" {
    default = "10.0.2.0/24"
}

variable "cidr_3" {
    default = "10.0.3.0/24"
}

# instance variables
variable "ami" {
  description = "ami from which we need to build the ec2 instance"
}

variable "key_name" {
  description = "instance key"
}

variable "instance_type" {
  description = "type of instance that need to be created"
}

# loadbalancer variables
variable "ssl_certificate_arn" {
  description = "certificate arn"
}

