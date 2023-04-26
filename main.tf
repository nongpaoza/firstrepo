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
resource "aws_route53_zone" "settrade-com" {
  name = "settrade.com"
}
# Create AWS ec2 instance ----------------------------------------------------------------------------1
resource "aws_instance" "myFirstInstance" {
  ami           = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  #security_groups= [var.security_group]
  #security_groups= [var.security_group2]
  vpc_security_group_ids = ["sg-0283926adc0c8f457"]
  subnet_id = var.subnet_id
  private_ip = "10.219.68.150"
  tags= {
    Name = var.itppt-lb041
  }
}


# Create Elastic IP address
resource "aws_eip" "myFirstInstance" {
  vpc      = true
  instance = aws_instance.myFirstInstance.id
tags= {
    Name = "my_elastic_ip"
  }
}


resource "aws_route53_record" "www-record" {
  zone_id = aws_route53_zone.settrade-com.zone_id
  name    = "wen041.settrade.com"
  type    = "A"
  ttl     = "300"
 # records = "10.219.68.150"
  records = [aws_instance.myFirstInstance.private_ip]
}

# Create AWS ec2 instance ----------------------------------------------------------------------------2
resource "aws_instance" "myFirstInstance2" {
  ami           = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  #security_groups= [var.security_group]
  #security_groups= [var.security_group2]
  vpc_security_group_ids = ["sg-0283926adc0c8f457"]
  subnet_id = var.subnet_id
  private_ip = "10.219.68.151"
  tags= {
    Name = var.itppt-lb042
  }
}

# Create Elastic IP address
resource "aws_eip" "myFirstInstance2" {
  vpc      = true
  instance = aws_instance.myFirstInstance2.id
tags= {
    Name = "my_elastic_ip"
  }
}


resource "aws_route53_record" "www-record" {
  zone_id = aws_route53_zone.settrade-com.zone_id
  name    = "wen041.settrade.com"
  type    = "A"
  ttl     = "300"
 # records = "10.219.68.151"
  records = [aws_instance.myFirstInstance2.private_ip]
}