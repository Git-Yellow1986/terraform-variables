resource "aws_instance" "ec2" {

  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg_group.id]
  tags                   = var.tags
}

resource "aws_security_group" "sg_group" {
  name        = var.sg_name
  description = var.sg_description

  # Useally we allow everything in egress
  # egress {} , called block

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # Everything
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.port_no
    to_port          = var.port_no
    protocol         = var.protocal
    cidr_blocks      = var.cidr_ingress # Allow from everyone
    ipv6_cidr_blocks = var.ipv6_ingress
  }

  #   tags = merge(
  #     var.tags,
  #     {
  #       Name = var.sg_tags
  #     }
  #   )
  tags = {
    Name = var.sg_tags
  }
}

