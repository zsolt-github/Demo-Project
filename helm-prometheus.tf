# https://github.com/prometheus-community/helm-charts/

resource "helm_release" "helm-prometheus" {
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  #namespace        = kubernetes_namespace.k8s-ns-development.metadata.0.name
  depends_on       = [kubernetes_namespace.k8s-ns-development]
  #depends_on      = [azurerm_kubernetes_cluster_node_pool.aks-worker-pool-1]
  
  version          = "42.1.0"
  # version          = "41.5.1"
  # create_namespace = true
  # reset_values     = true
  # max_history      = 3

  
  #values = [
    # save the file in UTF-8 format
   # "${file("prometheus-stack-values.yaml")}"
  #]

  set {
    name  = "grafana.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "grafana.adminPassword"
    value = "adminpassword"
  }

}


/*
  set {
    name  = "prometheus.service.type"
    value = "LoadBalancer"
  }

set {
    name  = "prometheus.servicePerReplica.type"
    value = "LoadBalancer"
  }


}


# https://github.com/prometheus-community/helm-charts/

resource "helm_release" "helm-prometheus" {
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "prometheus"
  namespace        = kubernetes_namespace.k8s-ns-development.metadata.0.name
  depends_on       = [kubernetes_namespace.k8s-ns-development]

  values = [
    "${file("prometheus-values.yaml")}"
  ]

  #set {
  #  name  = "server.service.Type"
  #  value = "LoadBalancer"
  #}

}


*/