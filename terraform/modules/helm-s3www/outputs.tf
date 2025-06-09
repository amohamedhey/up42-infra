output "release_name" {
  description = "Name of the Helm release"
  value       = helm_release.s3www.name
}

output "namespace" {
  description = "Kubernetes namespace where the release is deployed"
  value       = helm_release.s3www.namespace
}

output "status" {
  description = "Status of the Helm release"
  value       = helm_release.s3www.status
}

output "version" {
  description = "Version of the deployed Helm chart"
  value       = helm_release.s3www.version
}
