variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "roboshop practice ami"
}

variable "instance_type" {
  type    = string
  
}

variable "common_tags" {
  default = {
    Name    = "tfvars"
    Project = "Roboshop"
    Terraform = true
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

variable "environment" {

}

