variable "kubeconfig_path" {
  description = "Path to kubeconfig"
  type        = string
  default     = "~/.kube/config"
}

variable "argocd_namespace" {
  description = "ArgoCD namespace"
  type        = string
  default     = "argocd"
}

variable "argocd_chart_version" {
  description = "ArgoCD Helm chart version"
  type        = string
  default     = "10.9.2"
}

variable "argocd_image_updater_chart_version" {
  description = "ArgoCD Image Updater helm chart version"
  type        = string
  default     = "1.3.1"
}

variable "cert_manager_namespace" {
  description = "cert-manager namespace"
  type        = string
  default     = "cert-manager"
}

variable "cert_manager_chart_version" {
  description = "cert-manager helm chart version"
  type        = string
  default     = "1.21.2"
}
