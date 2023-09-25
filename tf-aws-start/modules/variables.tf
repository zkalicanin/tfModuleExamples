variable "ec2_instance_type" {
  default = "t2.micro"
  type = string
}

variable "ec2_insance_name" {
  default = "my-ec2-instance"
  type = string
}

variable "number_of_instances" {
  default = 1
  type = number
}