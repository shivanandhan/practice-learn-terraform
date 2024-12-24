resource "aws_route53_record" "record" {
  zone_id = "Z01735512UFOFLO7B90DS"
  name    = "${var.instance_name}-dev.kndevops72.online"
  type    = "A"
  ttl     = "30"
  records = [var.ip_address]
}

variable "instance_name"{}
variable "ip_address"{}