resource "helm_release" "s3www" {
  name             = var.release_name
  namespace        = var.namespace
  create_namespace = var.create_namespace
  repository       = var.chart_repository
  chart            = var.chart_name
  version          = var.chart_version

  values = [
    templatefile("${path.module}/values.yaml", {
      minio_access_key = var.minio_access_key
      minio_secret_key = var.minio_secret_key
      minio_bucket     = var.minio_bucket
      minio_endpoint   = var.minio_endpoint
      replica_count    = var.replica_count
      configmap_data   = var.configmap_data
      image_repository = var.image_repository
      image_tag        = var.image_tag
      service_type     = var.service_type
      service_port     = var.service_port
      ingress_enabled  = var.ingress_enabled
      ingress_host     = var.ingress_host
      autoscaling_enabled = var.autoscaling_enabled
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
