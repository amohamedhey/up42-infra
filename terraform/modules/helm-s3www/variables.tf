variable "release_name" {
  description = "Name of the Helm release"
  type        = string
  default     = "s3www"
}

variable "namespace" {
  description = "Kubernetes namespace to deploy the release"
  type        = string
  default     = "default"
}

variable "create_namespace" {
  description = "Whether to create the namespace if it doesn't exist"
  type        = bool
  default     = true
}

variable "chart_repository" {
  description = "Helm chart repository URL"
  type        = string
  default     = "../../../helm" # Local chart repository
}

variable "chart_name" {
  description = "Name of the Helm chart"
  type        = string
  default     = "s3wwww"
}

variable "chart_version" {
  description = "Version of the Helm chart"
  type        = string
  default     = "0.1.0"
}

variable "minio_access_key" {
  description = "MinIO access key"
  type        = string
  sensitive   = true
}

variable "minio_secret_key" {
  description = "MinIO secret key"
  type        = string
  sensitive   = true
}

variable "minio_bucket" {
  description = "MinIO bucket name"
  type        = string
  default     = "up42-bucket"
}

variable "minio_endpoint" {
  description = "MinIO endpoint URL"
  type        = string
}

variable "replica_count" {
  description = "Number of replicas to deploy"
  type        = number
  default     = 1
}

variable "image_repository" {
  description = "Container image repository"
  type        = string
  default     = "y4m4/s3www"
}

variable "image_tag" {
  description = "Container image tag"
  type        = string
  default     = "v0.9.0"
}

variable "service_type" {
  description = "Kubernetes service type"
  type        = string
  default     = "ClusterIP"
}

variable "service_port" {
  description = "Kubernetes service port"
  type        = number
  default     = 8080
}

variable "configmap_data" {
  description = "Data to be stored in the ConfigMap"
  type        = map(string)
  default = {
    "index.html" = <<-EOT
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <title>Embedded Giphy GIF</title>
      </head>
      <body>
        <h1>Enjoy this GIF!</h1>
        <iframe src="https://giphy.com/embed/VdiQKDAguhDSi37gn1" width="480" height="270" frameBorder="0" allowFullScreen></iframe>
        <p><a href="https://giphy.com/gifs/VdiQKDAguhDSi37gn1">View on Giphy</a></p>
      </body>
      </html>
    EOT
  }
}

variable "autoscaling_enabled" {
  description = "Whether to enable autoscaling"
  type        = bool
  default     = true
}

variable "additional_values" {
  description = "Additional values to set in the Helm chart"
  type        = map(string)
  default     = {}
}

variable "ingress_enabled" {
  description = "Whether to enable ingress"
  type        = bool
  default     = false
}

variable "ingress_host" {
  description = "Ingress host"
  type        = string
}
