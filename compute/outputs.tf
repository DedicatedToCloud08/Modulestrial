output "public_ip" {
  value = values(aws_instance.amazon_linux)[*].public_ip
}