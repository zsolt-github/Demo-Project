resource "azurerm_resource_group" "aks-rg" {
  name     = var.az_resource_group_name
  location = var.az_location

  tags = {
    "ResourceType" = "Resrouce Group"
    "Evironment"   = "test"
  }
}

resource "azurerm_virtual_network" "aks-vnet" {
  name                = var.az_virtual_network_name
  resource_group_name = var.az_resource_group_name
  location            = var.az_location
  address_space       = [var.az_virtual_network_address_space]
  depends_on          = [azurerm_resource_group.aks-rg]

  tags = {
    "ResourceType" = "Virtual Network"
    "Environment"  = "test"
  }  
}

resource "azurerm_subnet" "aks-subnet" {
  name                 = var.az_subnet_name
  resource_group_name  = var.az_resource_group_name
  virtual_network_name = var.az_virtual_network_name
  address_prefixes     = [var.az_subnet_address_prefix]
  depends_on           = [azurerm_virtual_network.aks-vnet]
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.az_location
  resource_group_name = var.az_resource_group_name
  kubernetes_version  = var.aks_version
  dns_prefix          = var.aks_cluster_name

  default_node_pool {
    name                = var.aks_default_node_name
    node_count          = var.aks_default_node_count
    vm_size             = var.aks_default_node_vm_size
    type                = var.aks_default_node_node_type
#    zones               = [1, 2, 3]
    vnet_subnet_id      = azurerm_subnet.aks-subnet.id
  
    enable_auto_scaling = false
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet" 
  }

  identity {
    type = "SystemAssigned"
  }

/*
  service_principal {
    client_id     = var.aks_appId
    client_secret = var.aks_password
  }

  role_based_access_control {
    enabled = true
  }
*/

  tags = {
      "ResourceType" = "Kubernetes"
      "Environment"  = "test"
  }
}

/*
resource "azurerm_kubernetes_cluster_node_pool" "aks-worker-pool-1" {
  name                  = var.aks_worker_pool_1_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.aks_worker_pool_1_vm_size
#  type                  = var.aks_worker_pool_1_node_type
  vnet_subnet_id        = azurerm_subnet.aks-subnet.id
  
  enable_auto_scaling   = true
  max_count             = var.aks_worker_pool_1_auto_scaling_max_count
  min_count             = var.aks_worker_pool_1_auto_scaling_min_count
  node_count            = var.aks_worker_pool_1_count
  
  tags = {
      "ResourceType" = "Kubernetes"
      "Environment"  = "test"
  }
}

*/

resource "local_file" "aks_kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.aks]
  filename     = "./kubeconfig"
  content      = azurerm_kubernetes_cluster.aks.kube_config_raw
}

/*

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.az_resource_group_name
  location            = var.az_location
  sku                 = "Standard"
  admin_enabled       = false

  tags = {
    "ResourceType" = "Container Registry"
    "environment"  = "test"
  }
}

resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}


*/
