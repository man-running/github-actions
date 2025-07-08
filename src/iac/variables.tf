variable "main_vpc_cidr" {}
variable "public_subnet_1" {}
variable "public_subnet_2" {}
variable "private_subnet" {}
variable "region" {}
variable "az1" {}
variable "az2" {}

variable "region-primary" {
  type    = string
  default = "us-east-1"
}

variable "region-secondary" {
  type    = string
  default = "us-west-2"
}

variable "in_pipeline" {
    type = bool
    default = true
    description = "Used to indicate if this is being run in a CI/CD pipeline"
}