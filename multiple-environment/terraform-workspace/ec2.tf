# Create a roboshop project instances
resource "aws_instance" "roboshop" {
 
  for_each              = var.instances
  ami                    = var.ami_id
  # instance_type          = terraform.workspace == "prod" ? "t3.micro" : "t2.micro"
  instance_type          = lookup(var.instance_type,terraform.workspace,"t2.micro")
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = merge(
    var.common_tags,
    {
      Name = "roboshop-${each.key}-${terraform.workspace}"
      Component = each.key
      Environment = terraform.workspace
    }
  )

}

# Create a Security Group
resource "aws_security_group" "allow-all" {
  name        = "${var.sg_name}-${terraform.workspace}"
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
      Name        = "${var.sg_name}-${terraform.workspace}"
      Environment = terraform.workspace
    }
  )

}
