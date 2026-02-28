locals {
  termination_protection = var.environment == "prod" ? true : false
}


data "aws_ami" "amazon_latest" {
  most_recent = true
  owners = [ "amazon" ]

  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-x86_64-gp2" ]
  }

  filter {
    name = "state"
    values = [ "available" ]
  }
}

resource "aws_key_pair" "key" {
  key_name = "${var.environment}-key"
  public_key = file(var.key_path)
}

resource "aws_instance" "amazon_linux" {
  for_each = var.instances
  ami = data.aws_ami.amazon_latest.id
  instance_type = each.value
  subnet_id = var.subnet_id
  disable_api_termination = local.termination_protection
  key_name = aws_key_pair.key.key_name
  vpc_security_group_ids = [ var.sg_id ]
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                amazon-linux-extras install nginx1
                systemctl start nginx
                systemctl enable nginx
                EOF
    tags = {
      Name = each.key
      environment = var.environment
    }
}



