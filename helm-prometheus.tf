# https://github.com/prometheus-community/helm-charts/

resource "helm_release" "helm-prometheus" {
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "prometheus"

#  values = [
#    "${file("prometheus-values.yaml")}"
#  ]
}

/*
# https://github.com/prometheus-community/helm-charts/

resource "helm_release" "helm-prometheus" {
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  #namespace        = kubernetes_namespace.k8s-ns-development.metadata.0.name
  
  # version          = "41.5.0"
  # create_namespace = true
  # reset_values     = true
  # max_history      = 3
}
*/