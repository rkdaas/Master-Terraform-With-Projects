output "instance_id" {
  value = aws_instance.ec2-demo-production.id
}

output "public_ip" {
  value = aws_instance.ec2-demo-production.public_ip
}
