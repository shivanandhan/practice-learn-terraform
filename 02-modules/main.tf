module "ec2"{
  count = length(var.instances)
  source = "./ec2"
  instance_name = var.instances[count.index]
}

module "route53"{
  count = length(var.instances)
  source = "./route53"
  instance_name = var.instances[count.index]
  ip_address = module.ec2[count.index].ip_address
}

//this will print on the console when confused how to use the list
# output "ip"{
#   value = module.ec2
# }

variable "instances"{

  default = [
  "test1",
    "test2"
  ]
}