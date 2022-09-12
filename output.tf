output "aks_id" {
  description = "ID of the Azure Kubernetes cluster"
  value = azurerm_kubernetes_cluster.aks.id
  # sensitive = false
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "azure_k8s_node_rg" {
  value = azurerm_kubernetes_cluster.aks.node_resource_group
}

/*
output "azure_resource_group_name" {
  value = azurerm_resource_group.aks-rg.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_host" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.host
}

output "aks_client_key" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_key
}

output "aks_client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
}

output "aks_kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "aks_cluster_username" {
  value = azurerm_kubernetes_cluster.default.kube_config.0.username
  # sensitive = true
}

output "aks_cluster_password" {
  value = azurerm_kubernetes_cluster.default.kube_config.0.password
  # sensitive = true
}
*/

/*
output "acr_id" {
  value = azurerm_container_registry.acr.id
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}
*/