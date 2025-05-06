provider "aws" {
    region = var.aws_region
}

module ec2-instance{
    source="../terraform-aws-webinfra/modules/ec2-instance"
    ami_id = var.ami_id
    instance_type = var.instance_type
}