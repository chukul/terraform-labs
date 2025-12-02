# Test file for Atlantis integration
resource "null_resource" "atlantis_test" {
  triggers = {
    timestamp = "2025-12-02T23:47:00Z"
  }
}

output "atlantis_test" {
  value = "Atlantis is working!"
}
