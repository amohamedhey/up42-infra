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

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.minio_operator](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_values"></a> [additional\_values](#input\_additional\_values) | Additional values to set for the MinIO operator Helm chart | `map(string)` | `{}` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of the MinIO operator Helm chart | `string` | `"7.1.1"` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Whether to create the namespace if it doesn't exist | `bool` | `true` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernetes namespace for the MinIO operator | `string` | `"minio-operator"` | no |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | Name of the MinIO operator Helm release | `string` | `"minio-operator"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_namespace"></a> [namespace](#output\_namespace) | The namespace where the MinIO operator is installed |
| <a name="output_status"></a> [status](#output\_status) | The status of the MinIO operator Helm release |
