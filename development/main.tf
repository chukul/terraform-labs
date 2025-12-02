resource "random_pet" "server" {
  length = 2
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

output "server_name" {
  value = "${random_pet.server.id}-${random_string.suffix.result}"
}
