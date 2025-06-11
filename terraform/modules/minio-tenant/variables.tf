variable "release_name" {
  description = "Name of the MinIO tenant Helm release"
  type        = string
  default     = "minio-tenant"
}

variable "namespace" {
  description = "Kubernetes namespace for the MinIO tenant"
  type        = string
  default     = "tenant-ns"
}

variable "create_namespace" {
  description = "Whether to create the namespace if it doesn't exist"
  type        = bool
  default     = true
}

variable "chart_version" {
  description = "Version of the MinIO tenant Helm chart"
  type        = string
  default     = "7.1.1"
}

variable "tenant_name" {
  description = "Name of the MinIO tenant"
  type        = string
  default     = "up42-minio"
}

variable "pool_servers" {
  description = "Number of servers in the MinIO tenant pool"
  type        = number
  default     = 2
}

variable "pool_volumes" {
  description = "Number of volumes per server in the MinIO tenant pool"
  type        = number
  default     = 2
}

variable "pool_size" {
  description = "Size of each volume in the MinIO tenant pool (e.g., '10Gi')"
  type        = string
  default     = "10Mi"
}

variable "access_key" {
  description = "Access key for the MinIO tenant"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Secret key for the MinIO tenant"
  type        = string
  sensitive   = true
}

variable "bucket_name" {
  description = "Name of the bucket to create in the MinIO tenant"
  type        = string
  default     = "up42-bucket"
}

variable "user_name" {
  description = "Name of the MinIO tenant user"
  type        = string
  default     = "up42-user"
}

variable "metrics_enabled" {
  description = "Whether to enable metrics for the MinIO tenant"
  type        = bool
  default     = true
}

variable "request_auto_cert" {
  description = "Whether to request automatic certificate for the MinIO tenant"
  type        = bool
  default     = false
}

variable "prometheus_operator_enabled" {
  description = "Whether to enable Prometheus operator integration"
  type        = bool
  default     = true
}

variable "prometheus_auth_type" {
  description = "Authentication type for Prometheus metrics"
  type        = string
  default     = "public"
}

variable "service_monitor_name" {
  description = "Name of the ServiceMonitor resource for metrics"
  type        = string
  default     = "up42-minio"
}

variable "metrics_interval" {
  description = "Interval for metrics collection"
  type        = string
  default     = "30s"
}

variable "additional_values" {
  description = "Additional values to set for the MinIO tenant Helm chart"
  type        = map(string)
  default     = {}
}
