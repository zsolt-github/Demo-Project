resource "azurerm_resource_group" "aks-rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    "ResourceType" = "Resrouce Group"
    "Evironment"   = "test"
  }
}

resource "azurerm_virtual_network" "aks-vnet" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = [var.virtual_network_address_space]
  depends_on          = [azurerm_resource_group.aks-rg]

  tags = {
    "ResourceType" = "Virtual Network"
    "Environment"  = "test"
  }  
}

resource "azurerm_subnet" "aks-subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.subnet_address_prefix]
  depends_on           = [azurerm_virtual_network.aks-vnet]
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.k8s_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kubernetes_version  = var.k8s_version
  dns_prefix          = var.k8s_cluster_name

  default_node_pool {
    name                = var.k8s_default_node_name
    node_count          = var.k8s_default_node_count
    vm_size             = var.k8s_default_node_vm_size
    type                = var.k8s_default_node_node_type
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

  tags = {
      "ResourceType" = "Kubernetes"
      "Environment"  = "test"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "aks-worker-pool-1" {
  name                  = var.k8s_worker_pool_1_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.k8s_worker_pool_1_vm_size
#  type                  = var.k8s_worker_pool_1_node_type
  vnet_subnet_id        = azurerm_subnet.aks-subnet.id
  
  enable_auto_scaling   = true
  max_count             = var.k8s_worker_pool_1_auto_scaling_max_count
  min_count             = var.k8s_worker_pool_1_auto_scaling_min_count
  node_count            = var.k8s_worker_pool_1_count
  
  tags = {
      "ResourceType" = "Kubernetes"
      "Environment"  = "test"
  }
}

/*
resource "local_file" "kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.aks]
  filename     = "kubeconfig"
  content      = azurerm_kubernetes_cluster.aks.kube_config_raw
}

resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = false

  tags = {
    "ResourceType" = "Container Registry"
    "environment"  = "test"
  }
}
*/
