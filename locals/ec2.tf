resource "aws_instance" "roboshop" {
  # count   = 4
  # count loop can be work with only LIST TYPE data
  # when  we use count, count.index is special variable which holds the (var. instances) iteration value, it will change for every iteration 
  count                  = length(var.instances)
  ami                    = var.ami_id
  instance_type          = var.environment == "prod" ? "t3.micro" : "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = merge(
    local.ec2_tags,
    {
      # Name = "${var.Project}-${var.environment}-${var.instances[count.index]} "
      Name = "${local.final_name}-${var.instances[count.index]} "
      component   = var.instances[count.index]
    }
  )

}

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
