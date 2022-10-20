# https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-mongodb-exporter
# https://artifacthub.io/packages/helm/prometheus-community/prometheus-mongodb-exporter

/*
resource "helm_release" "helm-prometheus-mongodb-exporter" {
  name             = "prometheus-mongodb-exporter"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "prometheus-mongodb-exporter"

  values = [
    "${file("prometheus-mongodb-exporter-values.yaml")}"
  ]
}

*/