resource "aws_instance" "ec2-demo-production" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "ec2-demo-${var.instance_type}"
  }
}

resource "aws_instance" "ec2-demo-production-2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "ec2-demo-${var.instance_type}"
  }
}