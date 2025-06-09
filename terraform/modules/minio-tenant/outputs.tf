output "namespace" {
  description = "The namespace where the MinIO tenant is installed"
  value       = helm_release.minio_tenant.namespace
}

output "tenant_name" {
  description = "The name of the MinIO tenant"
  value       = var.tenant_name
}

output "bucket_name" {
  description = "The name of the created bucket"
  value       = var.bucket_name
}

output "status" {
  description = "The status of the MinIO tenant Helm release"
  value       = helm_release.minio_tenant.status
}
