resource "aws_instance" "sample" {
  ami = data.ec2_ami_id
  instance_type = var.ec2_instance_type

  tags = {
    Name = var.ec2_instance_name
  }
}