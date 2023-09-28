variable "ec2_instance_type" {
  default = "t2.micro"
  type = string
  description = "value of ec2 instance type"
}

variable "ec2_insance_name" {
  default = "my-ec2-instance"
  type = string
  description = "value of ec2 instance name"	
}

variable "number_of_instances" {
  default = 1
  type = number
  description = "value of number of instances"
}

variable "ec2_ami_id" {
  type = string
  description = "value of ec2 ami id"
}
  
