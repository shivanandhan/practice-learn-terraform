module "roboshop"{
  for_each = var.instances
  source = "./module"
  name = each.key
}

variable "instances"{
  default = {
    frontend ={}
    mongodb = {}
    catalogue = {}
  }
}