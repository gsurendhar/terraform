# Create a roboshop project instances
resource "aws_instance" "loops" {
  # for each can be only work with MAP TYPE data
  # for each loops one special type variable is "each" --> each.key and each.value 
  # for this list type data can be converted to map type bt toset or tomap function
  # for_each= toset(var.instances)

  # in var.instances map data is provided we can directly use
  for_each              = var.instances
  ami                    = var.ami_id
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = merge(
    var.common_tags,
    {
      Name = "roboshop-${var.environment}-${each.key}"
    }
  )

}

# Create a Security Group
resource "aws_security_group" "allow-all" {
  name        = var.sg_name
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

}
