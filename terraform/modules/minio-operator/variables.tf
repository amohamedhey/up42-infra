variable "release_name" {
  description = "Name of the MinIO operator Helm release"
  type        = string
  default     = "minio-operator"
}

variable "namespace" {
  description = "Kubernetes namespace for the MinIO operator"
  type        = string
  default     = "minio-operator"
}

variable "create_namespace" {
  description = "Whether to create the namespace if it doesn't exist"
  type        = bool
  default     = true
}

variable "chart_version" {
  description = "Version of the MinIO operator Helm chart"
  type        = string
  default     = "7.1.1"
}

variable "additional_values" {
  description = "Additional values to set for the MinIO operator Helm chart"
  type        = map(string)
  default     = {}
}
