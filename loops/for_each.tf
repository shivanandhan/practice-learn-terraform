variable "fruits" {
  default = {
    apple =  {}
    banana = {}
    orange = {}
  }
}

resource "null_resource" "fruits" {
  for_each = var.fruits
}