# Testing Atlantis auto-merge feature
resource "null_resource" "automerge_test" {
  triggers = {
    timestamp = "2025-12-03T00:01:00Z"
    feature   = "auto-merge"
  }
}

output "automerge_test" {
  value = "This PR should auto-merge after successful apply!"
}
