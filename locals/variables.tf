variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "roboshop practice ami"
}

# variable "instance_type" {
#   type    = string
#   default = "t2.micro"
# }

variable "common_tags" {
  default = {
    Project   = "Roboshop"
    Terraform = true
    version = "1.0"
  }
}

variable "Project" {
  default = "roboshop"
}

# variable "environment" {
#   default = "dev"
# }

variable "environment"{
  default = "prod"
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

variable "instances" {
  default = ["mongodb", "catalogue", "redis", "user", "cart", "frontend", "mysql", "shipping", "rabbitmq", "payment", "dispatch"]
}
