#ami search 
data "aws_ami" "devops" {
  owners      = ["973714476881"]
  most_recent = true


  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


}


# NS records of hosted zone for provider
data "aws_route53_zone" "selected" {
  name         = "gonela.site" # Replace with your domain name
  # or
  # zone_id = "Z2FDTNDUVT1FRY" # Replace with your hosted zone ID
}
