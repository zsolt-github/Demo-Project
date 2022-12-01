# https://github.com/prometheus-community/helm-charts/

resource "helm_release" "helm-prometheus" {
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = kubernetes_namespace.k8s-ns-monitoring.metadata.0.name
  depends_on      = [azurerm_kubernetes_cluster_node_pool.aks-worker-pool-1]
  
  version          = "42.1.0"
  # version          = "41.5.1"
  
  
  values = [    
    "${file("./Helm-files/prometheus-stack-values.yaml")}"
  ]

  set {
    name  = "grafana.adminPassword"
    value = "adminpassword"
  }

  set {
    name  = "grafana.service.type"
    value = "LoadBalancer"
  }

    set {
    name  = "prometheus.service.type"
    value = "LoadBalancer"
  }
}