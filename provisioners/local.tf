

resource "aws_instance" "roboshop" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  # vpc_security_group_ids = "sg-09842cd2938898ff3"
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = {
    Name    = "Mongodb"
    Project = "Roboshop"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> inventory "
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> inventory "
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
    #   "sudo systemctl status nginx"
      "sudo systemctl is-active nginx"
    ]
  }
  provisioner "remote-exec" {
    inline = [
      "sudo systemctl stop nginx",
    #   "sudo systemctl status nginx",
      "sudo systemctl is-active nginx"

    ]
    when = "destroy"
  }

}

resource "aws_security_group" "allow-all" {
  name        = "allow-all"
  description = " allowing all ports from internet "
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name    = "Allow-all"
    Project = "Roboshop"
  }

}