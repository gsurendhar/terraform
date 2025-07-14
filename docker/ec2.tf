resource "aws_instance" "docker" {
    ami  = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    # vpc_security_group_ids = "sg-09842cd2938898ff3"
    vpc_security_group_ids = [aws_security_group.docker-allow-all.id]
    user_data = file("docker-installation.sh")

    tags    = {
        Name = "Mongodb"
        Project = "Roboshop"
    }
}

resource "aws_security_group" "docker-allow-all" {
    name = "Docker"
    description = " allowing all ports from internet "
    ingress {
        from_port   =   0
        to_port     =   0
        protocol    =   "-1"
        cidr_blocks =   ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port   =   0
        to_port     =   0
        protocol    =   "-1"
        cidr_blocks =   ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags    = {
        Name = "Allow-all"
        Project = "Docker"
    }
}