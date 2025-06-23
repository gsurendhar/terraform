output "instance_id" {
  value       = aws_instance.test.id
}

output "private_ip" {
  value       = aws_instance.test.private_ip
}

output "public_ip" {
  value       = aws_instance.test.public_ip
}


