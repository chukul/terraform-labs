resource "random_pet" "server" {
  length = 2
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "null_resource" "atlantis_demo" {
  triggers = {
    timestamp = "2025-12-02T23:55:00Z"
    message   = "Testing Atlantis automation"
  }
}

output "server_name" {
  value = "${random_pet.server.id}-${random_string.suffix.result}"
}

output "atlantis_status" {
  value = "Atlantis is working!"
}
