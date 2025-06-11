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
| [helm_release.s3www](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_values"></a> [additional\_values](#input\_additional\_values) | Additional values to set in the Helm chart | `map(string)` | `{}` | no |
| <a name="input_autoscaling_enabled"></a> [autoscaling\_enabled](#input\_autoscaling\_enabled) | Whether to enable autoscaling | `bool` | `true` | no |
| <a name="input_chart_name"></a> [chart\_name](#input\_chart\_name) | Name of the Helm chart | `string` | `"s3wwww"` | no |
| <a name="input_chart_repository"></a> [chart\_repository](#input\_chart\_repository) | Helm chart repository URL | `string` | `"../../../helm"` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of the Helm chart | `string` | `"0.1.0"` | no |
| <a name="input_configmap_data"></a> [configmap\_data](#input\_configmap\_data) | Data to be stored in the ConfigMap | `map(string)` | <pre>{<br/>  "index.html": "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>Embedded Giphy GIF</title>\n</head>\n<body>\n  <h1>Enjoy this GIF!</h1>\n  <iframe src=\"https://giphy.com/embed/VdiQKDAguhDSi37gn1\" width=\"480\" height=\"270\" frameBorder=\"0\" allowFullScreen></iframe>\n  <p><a href=\"https://giphy.com/gifs/VdiQKDAguhDSi37gn1\">View on Giphy</a></p>\n</body>\n</html>\n"<br/>}</pre> | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Whether to create the namespace if it doesn't exist | `bool` | `true` | no |
| <a name="input_image_repository"></a> [image\_repository](#input\_image\_repository) | Container image repository | `string` | `"y4m4/s3www"` | no |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | Container image tag | `string` | `"v0.9.0"` | no |
| <a name="input_ingress_enabled"></a> [ingress\_enabled](#input\_ingress\_enabled) | Whether to enable ingress | `bool` | `false` | no |
| <a name="input_ingress_host"></a> [ingress\_host](#input\_ingress\_host) | Ingress host | `string` | n/a | yes |
| <a name="input_minio_access_key"></a> [minio\_access\_key](#input\_minio\_access\_key) | MinIO access key | `string` | n/a | yes |
| <a name="input_minio_bucket"></a> [minio\_bucket](#input\_minio\_bucket) | MinIO bucket name | `string` | `"up42-bucket"` | no |
| <a name="input_minio_endpoint"></a> [minio\_endpoint](#input\_minio\_endpoint) | MinIO endpoint URL | `string` | n/a | yes |
| <a name="input_minio_secret_key"></a> [minio\_secret\_key](#input\_minio\_secret\_key) | MinIO secret key | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernetes namespace to deploy the release | `string` | `"default"` | no |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | Name of the Helm release | `string` | `"s3www"` | no |
| <a name="input_replica_count"></a> [replica\_count](#input\_replica\_count) | Number of replicas to deploy | `number` | `1` | no |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | Kubernetes service port | `number` | `8080` | no |
| <a name="input_service_type"></a> [service\_type](#input\_service\_type) | Kubernetes service type | `string` | `"ClusterIP"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_namespace"></a> [namespace](#output\_namespace) | Kubernetes namespace where the release is deployed |
| <a name="output_release_name"></a> [release\_name](#output\_release\_name) | Name of the Helm release |
| <a name="output_status"></a> [status](#output\_status) | Status of the Helm release |
| <a name="output_version"></a> [version](#output\_version) | Version of the deployed Helm chart |
