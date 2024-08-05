resource "kubernetes_namespace" "example" {
  metadata {
    name = "helm-deployed"
  }
}
resource "helm_release" "nginx" {
  name       = "nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"
  create_namespace = true
  namespace = "helm-installed"

  values = [
    file("nginx-values.yaml")
  ]
}