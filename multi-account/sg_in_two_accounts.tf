# creating dev sg in dev account
resource "aws_security_group" "allow-all-dev" {
    name = "allow-all-dev"
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
        Name = "Allow-all-dev"
        Project = "Roboshop"
    }
    provider = aws.dev
}

# creating prod sg in prod account
resource "aws_security_group" "allow-all-prod" {
    name = "allow-all-prod"
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
        Name = "Allow-all-prod"
        Project = "Roboshop"
    }
    provider = aws.prod
}