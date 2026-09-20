resource "kubernetes_namespace_v1" "argocd" {
  metadata {
    name = var.argocd_namespace
  }
}

resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = kubernetes_namespace_v1.argocd.metadata[0].name
  create_namespace = false

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argocd_chart_version

  values = [
    file("${path.module}/argocd-values.yaml")
  ]
}

resource "helm_release" "argocd_image_updater" {
  name             = "argocd-image-updater"
  namespace        = kubernetes_namespace_v1.argocd.metadata[0].name
  create_namespace = false

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-image-updater"
  version    = var.argocd_image_updater_chart_version

  values = [
    file("${path.module}/argocd-image-updater-values.yaml")
  ]
}

resource "kubernetes_namespace_v1" "cert_manager" {
  metadata {
    name = var.cert_manager_namespace
  }
}

resource "helm_release" "cert-manager" {
  name             = "cert-manager"
  namespace        = kubernetes_namespace_v1.cert_manager.metadata[0].name
  create_namespace = false

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = var.cert_manager_chart_version

  values = [
    file("${path.module}/cert-manager-values.yaml")
  ]
}
