output "ebs_volume_id" {
  description = "The ID of the created EBS volume"
  value       = aws_ebs_volume.example.id
}

output "ebs_volume_availability_zone" {
  description = "The availability zone of the created EBS volume"
  value       = aws_ebs_volume.example.availability_zone
}