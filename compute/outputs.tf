output "public_ip" {
  value = aws_instance.amazon_linux[*].public_ip
}