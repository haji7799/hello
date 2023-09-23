provider "aws" {
    region = "us-east-2"
    access_key = ""
    secret_key = ""
}

resource "aws_vpc" "my_10_vpc" {
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "my_10_vpc"
    }
}

resource "aws_security_group" "my_10_sg" {
    name = "my_sg"
    vsc_id = "my_10_vpc"

    ingress {
    description = "TLS from vpc"
    from_port = "8080"
    to_port = "8080"
    protocol = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_blocks]
    }  
}