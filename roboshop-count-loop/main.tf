variable "instances"{

  default = [
    "frontend",
     "mongodb",
     "catalogue",
      "redis",
      "mysql",
      "cart",
      "user",
      "rabbitmq",
       "shipping",
      "payment"
  ]
}

resource "aws_instance" "instance" {
  count = length(var.instances)
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0c6e17b6efba619a0"]
  tags = {
    Name = var.instances[count.index]
  }
}

resource "aws_route53_record" "record" {
  count = length(var.instances)
  zone_id = "Z01735512UFOFLO7B90DS"
  name    = "${var.instances[count.index]}-dev.kndevops72.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.instance[count.index].private_ip]
}