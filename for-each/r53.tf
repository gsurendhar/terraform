# Create a Route 53 Hosted Zone
resource "aws_route53_zone" "my_zone" {
  name = "gonela.site" # Replace with your domain name
}

# Create a Route 53 records
resource "aws_route53_record" "www" {
  # count = length(var.instances)

  for_each = aws_instance.loops
  zone_id  = aws_route53_zone.my_zone.zone_id
  #mongodb.gonela.site
  # name            = "${each.key}.${aws_route53_zone.my_zone.name} "
  name            = "${each.key}"
  type            = "A"
  ttl             = 10
  records         = [each.value.private_ip]
  allow_overwrite = true
}

# for frontend add public ip to gonela.site
resource "aws_route53_record" "frontend_public" {
  for_each = {
    for k, v in aws_instance.loops : k => v
    if k == "frontend"
  }

  zone_id  = aws_route53_zone.my_zone.zone_id

  name            = aws_route53_zone.my_zone.name
  type            = "A"
  ttl             = 10
  records         = [each.value.public_ip]
  allow_overwrite = true
}







data "aws_route53_zone" "selected" {
  # name         = "gonela.site" # Replace with your domain name
  # or
  zone_id = aws_route53_zone.my_zone.id           #"Z2FDTNDUVT1FRY"  Replace with your hosted zone ID
}

output "name_servers" {
  value = data.aws_route53_zone.selected.name_servers
}