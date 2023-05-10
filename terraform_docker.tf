terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami             = "ami-0277b52859bac6f4b"
  instance_type   = "t2.micro"
  key_name        = "mumbaikey"
  security_groups = [ "Docker" ]

  tags = {
    Name = "docker_install"
  }
}

resource "aws_security_group" "Docker" {
  tags = {
    type = "terraform-test-security-group"
  }
}