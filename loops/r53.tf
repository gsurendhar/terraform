# Create a Route 53 Hosted Zone
resource "aws_route53_zone" "my_zone" {
  name = "gonela.site" # Replace with your domain name
}

resource "aws_route53_record" "www" {
    count = length(var.instances)
    zone_id = aws_route53_zone.my_zone.zone_id
    #mongodb.gonela.site
    name    = "${var.instances[count.index]}.${aws_route53_zone.my_zone.zone_id} "
    type    = "A"
     ttl     = 10
    records = [aws_instance.loops[count.index].private_ip]
    allow_overwrite = true
}