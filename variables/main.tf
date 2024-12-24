variable "url" {
  default = "john"
}

#Accessing variables

output "URL" {
  value = var.url
}

# to print the variable in the combination of string

output "URL1" {
  value = "Url is ${var.url}"
}

variable "list"{
  default =[
     10,
     20,
     30
  ]
}

variable "maps" {
  default = {
    aws ={
      trainer = "abc"
      duration = 30
    }
    devops ={
      trainer = "xyz"
      duration =40
    }
  }
}

# Accessing List and Maps
output "list1" {
  value = var.list[1] # Prints the first index of List as index starts from 0
}

output "map1" {
  value = var.maps["devops"]["duration"]
}

# when we declare empty variable in terraform it asks for value in console
variable "trainer_name" {}
output "printvalue" {
  value = var.trainer_name
}