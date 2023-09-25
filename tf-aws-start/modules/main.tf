

resource "aws_instance" "sample" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type

  tags = {
    Name = var.ec2_instance_name
  }
}