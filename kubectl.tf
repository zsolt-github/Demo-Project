data "kubectl_file_documents" "k8s-ns-test" {
  content = file("./Kubernetes-files/namespace-test.yaml")
}

resource "kubectl_manifest" "k8s-ns-test" {
  for_each   = data.kubectl_file_documents.k8s-ns-test.manifests
  yaml_body  = each.value
  #depends_on = [azurerm_kubernetes_cluster.aks]
  depends_on = [azurerm_kubernetes_cluster_node_pool.aks-worker-pool-1]
}