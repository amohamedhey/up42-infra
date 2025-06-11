variable "minio_access_key" {
  description = "Access key for the MinIO tenant"
  type        = string
  #sensitive   = true
  default = "minio"
}

variable "minio_secret_key" {
  description = "Secret key for the MinIO tenant"
  type        = string
  #sensitive   = true
  default = "minio123"
}

variable "minio_bucket" {
  description = "MinIO bucket name for dev environment"
  type        = string
  default     = "up42-bucket"
}

variable "minio_endpoint" {
  description = "MinIO endpoint URL for dev environment"
  type        = string
  default     = "http://minio.tenant-ns.svc.cluster.local"
}

variable "s3www_ingress_host" {
  description = "Ingress host for s3www web application"
  type        = string
  default     = "s3www.up42.abdalazizmoh.com"
}
