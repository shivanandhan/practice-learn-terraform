resource "aws_instance" "frontend" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0c6e17b6efba619a0"]
  tags={
    Name = "Frontend"
  }
}
resource "aws_route53_record" "frontend" {
  zone_id = "Z01735512UFOFLO7B90DS"
  name    = "frontend-dev.kndevops72.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}