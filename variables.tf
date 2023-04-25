variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "ap-southeast-1"
}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     =  "ansible"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     =  "t2.micro"
}

variable "security_group" {
  description = "Name of security group"
  default     = "my-jenkins-security-group"
}
variable "security_group2" {
  description = "Name of security group"
  default     = "secgrp-sg-dev-stt-front"
}
variable "tag_name" {
  description = "Tag Name of for Ec2 instance"
  default     = "my-ec2-instance"
}

variable "ami_id" {
  description = "AMI for Ubuntu Ec2 instance"
  default     = "ami-0a72af05d27b49ccb"
}
variable "aws_vpc" {
  description = "vpc-sgdev-settrade"
  default     = "vpc-sgdev-settrade"
}
variable "vpc_id" {
  description = "vpc-06ee4b6bb2f1af866"
  default     = "vpc-06ee4b6bb2f1af866"
}
variable "subnet_id" {
  description = "subnet-0ef38970acae858f0"
  default     = "subnet-0ef38970acae858f0"
}



variable "itppt-lb041" {
  description = "Tag Name of for Ec2 instance"
  default     = "itppt-lb041"
}
variable "itppt-lb042" {
  description = "Tag Name of for Ec2 instance"
  default     = "itppt-lb042"
}
variable "itppt-lb043" {
  description = "Tag Name of for Ec2 instance"
  default     = "itppt-lb043"
}
variable "itppt-lb044" {
  description = "Tag Name of for Ec2 instance"
  default     = "itppt-lb044"
}

variable "private_ip" {
  description = "Tag Name of for Ec2 instance"
  default     = "10.219.68.100"
}