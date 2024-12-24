resource "aws_instance" "instance" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0c6e17b6efba619a0"]
  tags = {
    Name = var.instance_name
  }
}

variable "instance_name"{}

output "ip_address"{
  value = aws_instance.instance.private_ip
}

# output in root module will be printed on screen
# output in child module will not be printed on screen