variable "region" {
  default = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  default = "t2.micro"
}
