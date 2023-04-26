provider "aws" {
  region = var.aws_region
}

#Create vpc
#resource "aws_vpc" "main" {
# cidr_block = "10.0.0.0/16"
 
# tags = {
#   Name = "Project VPC"
# }
#}

#Create security group with firewall rules
#resource "aws_security_group" "my_security_group" {
#  name        = var.security_group
#  description = "security group for Ec2 instance"

#  ingress {
#    from_port   = 8080
#    to_port     = 8080
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }

# ingress {
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }

 # outbound from jenkis server
#  egress {
#    from_port   = 0
#    to_port     = 65535
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }

#  tags= {
#    Name = var.security_group
#  }
#}
#Create route53


#resource "aws_route53_zone" "settrade-com" {
#    name = "settrade.com"

#}

resource "aws_route53_zone" "private" {
  name = "settrade.com"
  vpc {
    vpc_id = var.vpc_id
  }
}


