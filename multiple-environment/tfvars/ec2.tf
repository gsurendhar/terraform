resource "aws_instance" "roboshop" {
  ami                    = var.ami_id
#   instance_type          = var.environment == "prod" ? "t3.micro" : "t2.micro"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = merge(
    var.common_tags,
    {
      Name        = "roboshop-${var.environment}"
      Environment = var.environment
    }
  )
}

resource "aws_security_group" "allow-all" {
  name        = "${var.sg_name}-${var.environment} "
  description = var.sg_descrip
  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.sg_cidr
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name        = "${var.sg_name}-${var.environment} "
      Environment = var.environment
    }
  )
}
