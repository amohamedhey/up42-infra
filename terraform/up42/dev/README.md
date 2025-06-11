## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.11.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.23.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.17.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_minio_operator"></a> [minio\_operator](#module\_minio\_operator) | ../../modules/minio-operator | n/a |
| <a name="module_minio_tenant"></a> [minio\_tenant](#module\_minio\_tenant) | ../../modules/minio-tenant | n/a |
| <a name="module_s3www"></a> [s3www](#module\_s3www) | ../../modules/helm-s3www | n/a |

## Resources

| Name | Type |
|------|------|
| [helm_release.prometheus](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_minio_access_key"></a> [minio\_access\_key](#input\_minio\_access\_key) | Access key for the MinIO tenant | `string` | `"minio"` | no |
| <a name="input_minio_bucket"></a> [minio\_bucket](#input\_minio\_bucket) | MinIO bucket name for dev environment | `string` | `"up42-bucket"` | no |
| <a name="input_minio_endpoint"></a> [minio\_endpoint](#input\_minio\_endpoint) | MinIO endpoint URL for dev environment | `string` | `"http://minio.tenant-ns.svc.cluster.local"` | no |
| <a name="input_minio_secret_key"></a> [minio\_secret\_key](#input\_minio\_secret\_key) | Secret key for the MinIO tenant | `string` | `"minio123"` | no |
| <a name="input_s3www_ingress_host"></a> [s3www\_ingress\_host](#input\_s3www\_ingress\_host) | Ingress host for s3www web application | `string` | `"s3www.up42.abdalazizmoh.com"` | no |

## Outputs

No outputs.
