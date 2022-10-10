resource "helm_release" "helm-jenkins" {
  name       = "prometheus"
  repository = "https://charts.jenkins.io"
  chart      = "prometheus-operator"
  namespace  = kubernetes_namespace.k8s-ns-development.metadata.0.name
}