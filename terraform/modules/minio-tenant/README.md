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
| [helm_release.minio_tenant](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | Access key for the MinIO tenant | `string` | n/a | yes |
| <a name="input_additional_values"></a> [additional\_values](#input\_additional\_values) | Additional values to set for the MinIO tenant Helm chart | `map(string)` | `{}` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the bucket to create in the MinIO tenant | `string` | `"up42-bucket"` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of the MinIO tenant Helm chart | `string` | `"7.1.1"` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Whether to create the namespace if it doesn't exist | `bool` | `true` | no |
| <a name="input_metrics_enabled"></a> [metrics\_enabled](#input\_metrics\_enabled) | Whether to enable metrics for the MinIO tenant | `bool` | `true` | no |
| <a name="input_metrics_interval"></a> [metrics\_interval](#input\_metrics\_interval) | Interval for metrics collection | `string` | `"30s"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernetes namespace for the MinIO tenant | `string` | `"tenant-ns"` | no |
| <a name="input_pool_servers"></a> [pool\_servers](#input\_pool\_servers) | Number of servers in the MinIO tenant pool | `number` | `2` | no |
| <a name="input_pool_size"></a> [pool\_size](#input\_pool\_size) | Size of each volume in the MinIO tenant pool (e.g., '10Gi') | `string` | `"500Mi"` | no |
| <a name="input_pool_volumes"></a> [pool\_volumes](#input\_pool\_volumes) | Number of volumes per server in the MinIO tenant pool | `number` | `2` | no |
| <a name="input_prometheus_auth_type"></a> [prometheus\_auth\_type](#input\_prometheus\_auth\_type) | Authentication type for Prometheus metrics | `string` | `"public"` | no |
| <a name="input_prometheus_operator_enabled"></a> [prometheus\_operator\_enabled](#input\_prometheus\_operator\_enabled) | Whether to enable Prometheus operator integration | `bool` | `true` | no |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | Name of the MinIO tenant Helm release | `string` | `"minio-tenant"` | no |
| <a name="input_request_auto_cert"></a> [request\_auto\_cert](#input\_request\_auto\_cert) | Whether to request automatic certificate for the MinIO tenant | `bool` | `false` | no |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | Secret key for the MinIO tenant | `string` | n/a | yes |
| <a name="input_service_monitor_name"></a> [service\_monitor\_name](#input\_service\_monitor\_name) | Name of the ServiceMonitor resource for metrics | `string` | `"up42-minio"` | no |
| <a name="input_tenant_name"></a> [tenant\_name](#input\_tenant\_name) | Name of the MinIO tenant | `string` | `"up42-minio"` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | Name of the MinIO tenant user | `string` | `"up42-user"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | The name of the created bucket |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | The namespace where the MinIO tenant is installed |
| <a name="output_status"></a> [status](#output\_status) | The status of the MinIO tenant Helm release |
| <a name="output_tenant_name"></a> [tenant\_name](#output\_tenant\_name) | The name of the MinIO tenant |
