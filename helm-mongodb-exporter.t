# https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-mongodb-exporter
# https://artifacthub.io/packages/helm/prometheus-community/prometheus-mongodb-exporter


resource "helm_release" "helm-prometheus-mongodb-exporter" {
  name             = "prometheus-mongodb-exporter"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "prometheus-mongodb-exporter"
  #namespace        = kubernetes_namespace.k8s-ns-development.metadata.0.name
  depends_on       = [helm_release.helm-mongodb]
  
  values = [
    "${file("prometheus-mongodb-exporter-values-original.yaml")}"
  ]
}
