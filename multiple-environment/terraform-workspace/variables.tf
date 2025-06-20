variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "roboshop practice ami"
}

variable "instance_type" {
  default = { 
    dev = "t2.micro"
    prod = "t3.micro"
    uat = "t2.micro"
    sit = "t2.micro"
  }
}

variable "common_tags" {
  default = {
    Project     = "Roboshop"
    Terraform   = true
  }
}

variable "sg_name" {
  default = "allow-all"
}

variable "sg_descrip" {
  default = " allowing all ports from internet "
}

variable "from_port" {
  type        = number
  default     = 0
  description = "allowing all ports"
}

variable "to_port" {
  type    = number
  default = 0
}

variable "sg_cidr" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "description"
}

variable "sg_tags" {
  type = map(string)
  default = {
    Name    = "Allow-all"
    Project = "Roboshop"
  }
  description = "sg group tags"
}


# variable "instances" {
#   default = ["mongodb", "catalogue", "redis", "user", "cart", "frontend", "mysql", "shipping", "rabbitmq", "payment", "dispatch"]
# }

variable "instances" {
  default = {
    "mongodb"   = "t2.micro"
    "catalogue" = "t2.micro"
    "redis"     = "t2.micro"
    "user"      = "t2.micro"
    "cart"      = "t2.micro"
    "frontend"  = "t2.micro"
    "mysql"     = "t2.micro"
    "shipping"  = "t2.micro"
    "rabbitmq"  = "t2.micro"
    "payment"   = "t2.micro"
    "dispatch"  = "t2.micro"
  }
}
