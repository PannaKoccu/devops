output "key_name" {
  value = aws_key_pair.deployer.key_name
}

output "public_ip" {
  value = aws_instance.web.public_ip
}