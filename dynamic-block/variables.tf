variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "roboshop practice ami"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "common_tags" {
  default = {
    Project     = "Roboshop"
    environment = "dev"
    Terraform   = true
  }
}

variable "sg_name" {
  default = "var-allow-all"
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

variable "environment" {
  default = "dev"
}

# variable "environment"{
#   default = "prod"
# }

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

variable "ingress_ports" {
  default =[
    {
      from_port= 22
      to_port = 22
    },
    {
      from_port= 80
      to_port = 80
    },
    {
      from_port= 8080
      to_port = 8080
    },
    {
      from_port= 443
      to_port = 443
    }
  ]
}