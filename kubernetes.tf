# Kubernetes namespaces

resource "kubernetes_namespace" "k8s-ns-monitoring" {
  metadata {
    name = "monitoring"
  }
  #depends_on = [azurerm_kubernetes_cluster.aks]
  depends_on = [azurerm_kubernetes_cluster_node_pool.aks-monitoring-node]
  #depends_on = [azurerm_kubernetes_cluster_node_pool.aks-worker-pool-1]
}

resource "kubernetes_namespace" "k8s-ns-jenkins" {
  metadata {
    name = "jenkins"
  }
  #depends_on = [azurerm_kubernetes_cluster.aks]
  depends_on = [azurerm_kubernetes_cluster_node_pool.aks-monitoring-node]
  #depends_on = [azurerm_kubernetes_cluster_node_pool.aks-worker-pool-1]
}

resource "kubernetes_namespace" "k8s-ns-development" {
  metadata {
    name = "development"
  }
  #depends_on = [azurerm_kubernetes_cluster.aks]
  depends_on = [azurerm_kubernetes_cluster_node_pool.aks-monitoring-node]
  #depends_on = [azurerm_kubernetes_cluster_node_pool.aks-worker-pool-1]
}

resource "kubernetes_namespace" "k8s-ns-production" {
  metadata {
    name = "production"
  }
  #depends_on = [azurerm_kubernetes_cluster.aks]
  depends_on = [azurerm_kubernetes_cluster_node_pool.aks-monitoring-node]
  #depends_on = [azurerm_kubernetes_cluster_node_pool.aks-worker-pool-1]
}