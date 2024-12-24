variable "instances"{
  default = {
    frontend ={}
    mongodb = {}
    catalogue = {}
    redis = {}
    cart = {}
    user = {}
    rabbitmq = {}

  }
}

resource "aws_instance" "instance" {
  for_each      =     var.instances
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0c6e17b6efba619a0"]
  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "record" {
  for_each = var.instances
  zone_id = "Z01735512UFOFLO7B90DS"
  name    = "${each.key}-dev.kndevops72.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.instance[each.key].private_ip]
}