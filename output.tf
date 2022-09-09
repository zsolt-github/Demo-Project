output "azure_k8s_id" {
  description = "ID of the Azure Kubernetes cluster"
  value = azurerm_kubernetes_cluster.aks.id
  # sensitive = true
}

output "azure_k8s_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "azure_k8s_node_rg" {
  value = azurerm_kubernetes_cluster.aks.node_resource_group
}


/*
output "acr_id" {
  value = azurerm_container_registry.acr.id
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}
*/