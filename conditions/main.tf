output "test"{
  value = var.x == 2 ? "yes it is true" : "no the value is false"
}


variable "x"{
  default = 2
}