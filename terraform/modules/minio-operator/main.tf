resource "helm_release" "minio_operator" {
  name             = var.release_name
  namespace        = var.namespace
  create_namespace = var.create_namespace
  repository       = "https://operator.min.io/"
  chart            = "operator"
  version          = var.chart_version

  dynamic "set" {
    for_each = var.additional_values
    content {
      name  = set.key
      value = set.value
    }
  }
}
