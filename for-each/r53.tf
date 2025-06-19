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
  name            = "${each.key}.${aws_route53_zone.my_zone.zone_id} "
  type            = "A"
  ttl             = 10
  records         = [each.value.private_ip]
  allow_overwrite = true
}