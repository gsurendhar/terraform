variable "sg_ids" {
  
  default           = ["sg-09842cd2938898ff3"]
  description       = "description"
}
 variable "tags" {
    default = {
        Project     = "roboshop"
        environment = "dev"
        Terraform   = "true"
        Name        = "roboshop-test"       
    }
}

variable "instance_type" {
    # default = "t2.micro"
    default = "t3.micro"
}