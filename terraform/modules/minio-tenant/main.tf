resource "helm_release" "minio_tenant" {
  name             = var.release_name
  namespace        = var.namespace
  create_namespace = var.create_namespace
  repository       = "https://operator.min.io/"
  chart            = "tenant"
  version          = var.chart_version

  values = [
    templatefile("${path.module}/values.yaml", {
      tenant_name                 = var.tenant_name
      pool_servers                = var.pool_servers
      pool_volumes                = var.pool_volumes
      pool_size                   = var.pool_size
      access_key                  = var.access_key
      secret_key                  = var.secret_key
      bucket_name                 = var.bucket_name
      user_name                   = var.user_name
      metrics_enabled             = var.metrics_enabled
      request_auto_cert           = var.request_auto_cert
      prometheus_operator_enabled = var.prometheus_operator_enabled
      prometheus_auth_type        = var.prometheus_auth_type
      service_monitor_name        = var.service_monitor_name
      metrics_interval            = var.metrics_interval
    })
  ]

  dynamic "set" {
    for_each = var.additional_values
    content {
      name  = set.key
      value = set.value
    }
  }
}
