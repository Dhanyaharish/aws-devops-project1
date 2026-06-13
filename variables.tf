variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "The size of the EC2 instance"
  type        = string
  default     = "t3.micro"
}
