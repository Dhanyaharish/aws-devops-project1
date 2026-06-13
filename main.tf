provider "aws" {
  region = "ap-south-1" # Ensure this matches your region
}

# 1. S3 Bucket
resource "aws_s3_bucket" "my_first_bucket" {
  bucket = "my-unique-s3-bucket-12-june-2026-yourname"
}

# 2. Dynamic AMI Lookup
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# 3. Security Group
resource "aws_security_group" "web_server_sg" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 4. EC2 Instance
resource "aws_instance" "my_first_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>Hello from my Terraform-managed server!</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "My-Terraform-Server"
  }
}
