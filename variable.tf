variable "ec2" {
  type    = string
  default = "demo-ec2"
}
variable "vpc" {
  type    = string
  default = "demo-vpc"
}
variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "subnet-cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "subnet-availability-zone" {
  type    = string
  default = "us-east-1a"
}
