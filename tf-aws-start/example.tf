data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "sample" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type

  tags = {
    Name = var.ec2_instance_name
  }
}

// VPC
// Subnets, 2x (public, private) = 4
// Internet Gateway
// Route Table
// Route for IGW
// NAT Gateway
// Route


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
}

module "my_ec2_instance" {
  source = "./new_module"

  ec2_instance_type = var.ec2_instance_type
  ec2_insance_name = var.ec2_instance_name
  number_of_instances = var.number_of_instances
  ec2_ami_id = data.aws_ami.ubuntu.id
}

output "instance_id" {
  value = module.my_ec2_instance.ec2_instance_id
}


