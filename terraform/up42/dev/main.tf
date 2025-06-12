# install dependencies prometheus in monitoring namespaces
# prometheus is used for monitoring and alerting

# prometheus
resource "helm_release" "prometheus" {
  name             = "prometheus"
  namespace        = "monitoring"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  version          = "73.2.0"
  create_namespace = true
  timeout          = 240
  values = [
    file("${path.module}/helm-values/prometheus-values.yaml")
  ]
}

# minio-operator is used for managing minio clusters
module "minio_operator" {
  source = "../../modules/minio-operator"

  release_name     = "minio-operator"
  namespace        = "minio-operator"
  create_namespace = true
  chart_version    = "7.1.1"
}

# minio-tenant is used for managing minio tenants
module "minio_tenant" {
  source = "../../modules/minio-tenant"

  depends_on = [module.minio_operator, helm_release.prometheus]

  # Tenant configuration
  release_name = "minio-tenant"
  namespace    = "tenant-ns"
  tenant_name  = "up42-minio"
  pool_servers = 2
  pool_volumes = 2
  pool_size    = "100Mi"
  bucket_name  = var.minio_bucket

  # Credentials - these should be provided via a secure method
  access_key = var.minio_access_key
  secret_key = var.minio_secret_key

}

# Main configuration for s3www deployment in dev environment
module "s3www" {
  source = "../../modules/helm-s3www"

  release_name = "dev"
  namespace    = "s3www"

  minio_access_key = var.minio_access_key
  minio_secret_key = var.minio_secret_key
  minio_bucket     = var.minio_bucket
  minio_endpoint   = var.minio_endpoint
  ingress_enabled  = true
  ingress_host     = var.s3www_ingress_host

  replica_count = 2

  depends_on = [module.minio_tenant]
}
