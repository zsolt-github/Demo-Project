# https://artifacthub.io/packages/helm/bitnami/mongodb

resource "helm_release" "helm-mongodb" {
  name             = "mongodb"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "mongodb"
}