#NS records of my hosted zone from provider
output "name_servers" {
  value = data.aws_route53_zone.selected.name_servers
}

# ami id from provider
output "ami_id" {
  value       = data.aws_ami.devops.id
  description = "ami id of roboshop project"

}