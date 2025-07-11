resource "aws_security_group" "allow-all" {
    id = "sg-0ebe2b16cf5477f47"
}

resource "aws_vpc" "roboshop-dev" {
    
    id = "vpc-063098a3b6322f4f1"
}