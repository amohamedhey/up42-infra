# UP42 Infrastructure Terraform

This directory contains the Terraform configuration for deploying the UP42 infrastructure, including the s3www application.

## Directory Structure

```
terraform/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars.example
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars.example
└── modules/
    └── helm-s3www/
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        └── values.yaml
```

## Prerequisites

- Terraform >= 1.0.0
- Kubernetes cluster with k3d
- Helm >= 3.0.0
- kubectl configured with access to the cluster

## Usage

1. Copy the example tfvars file and update the values:

```bash
cd environments/dev
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
```

2. Initialize Terraform:

```bash
terraform init
```

3. Plan the deployment:

```bash
terraform plan
```

4. Apply the configuration:

```bash
terraform apply
```

## Module: helm-s3www

The `helm-s3www` module deploys the s3www application using Helm. It includes:

- MinIO configuration
- ConfigMap for static files
- Deployment configuration
- Service configuration
- Resource limits and requests
- Health checks

### Variables

See `modules/helm-s3www/variables.tf` for all available variables.

### Outputs

- `release_name`: Name of the Helm release
- `namespace`: Kubernetes namespace where the release is deployed
- `status`: Status of the Helm release
- `version`: Version of the deployed Helm chart

## Environments

### Dev

The dev environment is configured for development and testing purposes. It includes:

- Single replica deployment
- Development-specific ConfigMap data
- Ingress configuration for dev domain

### Prod

The prod environment is configured for production use. It includes:

- Multiple replicas for high availability
- Production-specific ConfigMap data
- Production ingress configuration
- Additional security settings

## Security Notes

- Sensitive values like MinIO credentials should be stored securely
- Never commit `terraform.tfvars` files containing sensitive data
- Use appropriate RBAC settings in production
- Consider using a secrets management solution for production
