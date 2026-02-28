resource "aws_security_group" "sg_ssh_ngnix" {
  vpc_id = var.vpc_id
  name = "Allow SSH and HTTP access"
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = [ var.mypc ]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = [ var.mypc ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags = {
    Name = "${var.environment}-Subnet"
  }
}