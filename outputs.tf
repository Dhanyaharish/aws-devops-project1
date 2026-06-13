output "instance_public_ip" {
  description = "The public IP of our web server"
  value       = aws_instance.my_first_server.public_ip
}
