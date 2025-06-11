provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "k3d-up42-dev"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "k3d-up42-dev"
  }
}
