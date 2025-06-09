# install dependencies prometheus and ingress-nginx in monitoring and ingress-nginx namespaces respectively
# prometheus is used for monitoring and alerting
# ingress-nginx is used for ingress traffic

# ingress-nginx
# resource "helm_release" "ingress-nginx" {
#   name       = "ingress-nginx"
#   namespace  = "ingress-nginx"
#   repository = "https://kubernetes.github.io/ingress-nginx"
#   create_namespace = true
#   chart      = "ingress-nginx"
#   version    = "4.12.3"
# }

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

module "minio_operator" {
  source = "../../modules/minio-operator"

  release_name     = "minio-operator"
  namespace        = "minio-operator"
  create_namespace = true
  chart_version    = "7.1.1"
}

module "minio_tenant" {
  source = "../../modules/minio-tenant"

  depends_on = [module.minio_operator, helm_release.prometheus]

  # Tenant configuration
  release_name = "minio-tenant"
  namespace    = "tenant-ns"
  tenant_name  = "up42-minio"
  pool_servers = 2
  pool_volumes = 2
  pool_size    = "500Mi"
  bucket_name  = "up42-bucket"

  # Credentials - these should be provided via environment variables or a secure method
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
  ingress_host     = "s3www.up42.abdalazizmoh.com"

  replica_count = 2

  depends_on = [module.minio_tenant]
}
