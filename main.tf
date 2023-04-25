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

# Create AWS ec2 instance
resource "aws_instance" "myFirstInstance" {
  ami           = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  #security_groups= [var.security_group]
  security_groups= [var.security_group2]
  tags= {
    Name = var.tag_name
  }
}

# Create Elastic IP address
#resource "aws_eip" "myFirstInstance" {
#  vpc      = true
#  instance = aws_instance.myFirstInstance.id
#tags= {
#    Name = "my_elastic_ip"
#  }
#}


#Create route53
#resource "aws_route53_zone" "set-or-th" {
#  name = "set.or.th"
#}
#resource "aws_route53_record" "www-record" {
#  zone_id = aws_route53_zone.set-or-th.zone_id
#  name    = "www.set.or.th"
#  type    = "A"
#  ttl     = "300"
#  records = [aws_eip.myFirstInstance.public_ip]
#}