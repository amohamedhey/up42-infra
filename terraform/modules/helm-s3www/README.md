# Helm S3WWW Module

This Terraform module deploys the s3www application using Helm, which serves static content from an S3-compatible storage (MinIO).

## Features

- Deploys s3www application using Helm
- Configures MinIO integration
- Manages static content through ConfigMap
- Supports multiple environments
- Configurable resource limits and health checks
- Customizable service and ingress settings

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| kubernetes | >= 2.23.0 |
| helm | >= 2.11.0 |

## Providers

| Name | Version |
|------|---------|
| kubernetes | >= 2.23.0 |
| helm | >= 2.11.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| release_name | Name of the Helm release | `string` | `"s3www"` | no |
| namespace | Kubernetes namespace to deploy the release | `string` | `"default"` | no |
| create_namespace | Whether to create the namespace if it doesn't exist | `bool` | `true` | no |
| chart_repository | Helm chart repository URL | `string` | `"file://../../helm"` | no |
| chart_name | Name of the Helm chart | `string` | `"s3wwww"` | no |
| chart_version | Version of the Helm chart | `string` | `"0.1.0"` | no |
| minio_access_key | MinIO access key | `string` | n/a | yes |
| minio_secret_key | MinIO secret key | `string` | n/a | yes |
| minio_bucket | MinIO bucket name | `string` | `"up42-bucket"` | no |
| minio_endpoint | MinIO endpoint URL | `string` | n/a | yes |
| replica_count | Number of replicas to deploy | `number` | `1` | no |
| image_repository | Container image repository | `string` | `"y4m4/s3www"` | no |
| image_tag | Container image tag | `string` | `"v0.9.0"` | no |
| service_type | Kubernetes service type | `string` | `"ClusterIP"` | no |
| service_port | Kubernetes service port | `number` | `80` | no |
| configmap_data | Data to be stored in the ConfigMap | `map(string)` | See variables.tf | no |
| additional_values | Additional values to set in the Helm chart | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| release_name | Name of the Helm release |
| namespace | Kubernetes namespace where the release is deployed |
| status | Status of the Helm release |
| version | Version of the deployed Helm chart |

## Usage

```hcl
module "s3www" {
  source = "../../modules/helm-s3www"

  release_name = "s3www-dev"
  namespace    = "s3www-dev"

  minio_access_key = "your-access-key"
  minio_secret_key = "your-secret-key"
  minio_bucket     = "up42-bucket"
  minio_endpoint   = "http://minio.example.com:9000"

  replica_count = 1

  configmap_data = {
    "index.html" = <<-EOT
      <html>
        <body>
          <h1>Welcome to S3 Website</h1>
        </body>
      </html>
    EOT
  }

  additional_values = {
    "ingress.enabled" = "true"
    "ingress.hosts[0].host" = "s3www.example.com"
  }
}
```

## Notes

- The module uses a local Helm chart by default (`file://../../helm`)
- MinIO credentials are marked as sensitive
- The module creates a namespace if it doesn't exist (configurable)
- Resource limits and requests are set to reasonable defaults
- Health checks are configured with appropriate timeouts

## Security Considerations

- MinIO credentials should be managed securely
- Consider using a secrets management solution
- Review and adjust resource limits based on your needs
- Ensure proper RBAC settings are in place

## License

Apache 2 Licensed. See LICENSE for full details.
