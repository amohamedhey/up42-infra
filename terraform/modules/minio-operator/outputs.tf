output "namespace" {
  description = "The namespace where the MinIO operator is installed"
  value       = helm_release.minio_operator.namespace
}

output "status" {
  description = "The status of the MinIO operator Helm release"
  value       = helm_release.minio_operator.status
}
