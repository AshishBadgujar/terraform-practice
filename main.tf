resource "time_static" "time_update" {
}
resource "local_file" "pet" {
  filename = "pets.txt"
  content  = "my favorite pet is ${random_pet.my-pet.id} & timestamp of this file is ${time_static.time_update.id}"
  # sensitive_content = "I love pets" #not showed on terminal
}
#lifecycle
resource "random_pet" "my-pet" {
  length    = 1
  prefix    = "Mrs"
  separator = "."
  lifecycle {
    create_before_destroy = true
  }
}
resource "random_pet" "your-pet" {
  length    = 1
  prefix    = "Mr"
  separator = "."
  lifecycle {
    prevent_destroy = true
  }
}
#variables
resource "local_file" "variables_demo" {
  filename = var.filename
  content  = var.objects
  depends_on = [
    random_pet.my-pet
  ]
}

#output
output "pet" {
  value       = random_pet.my-pet.id
  description = "output"
}
#datasource
data "local_file" "datasource" {
  filename = "datasource.txt"
}
resource "local_file" "data-file" {
  filename = "data-file.txt"
  content  = data.local_file.datasource.content
}

#count
resource "local_file" "count" {
  filename = var.list[count.index]
  count    = length(var.list)
}
#for_each
resource "local_file" "for_each" {
  filename = each.value
  for_each = toset(var.objects["food"])
}

