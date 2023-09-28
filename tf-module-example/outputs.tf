output "ec2_instance_id" {
  value = aws_instance.sample.id
  description = "value of ec2 instance id"
}
