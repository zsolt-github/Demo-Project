# https://artifacthub.io/packages/helm/bitnami/mongodb

resource "helm_release" "helm-mongodb" {
  name             = "mongodb"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "mongodb"
  #namespace        = kubernetes_namespace.k8s-ns-development.metadata.0.name
  depends_on       = [helm_release.helm-jenkins]
}