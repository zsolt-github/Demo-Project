resource "azurerm_resource_group" "aks-rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    "ResourceType" = "Resrouce Group"
    "environment"  = "test"
  }
}

resource "azurerm_virtual_network" "example" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = [var.virtual_network_address_space]
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.aks-rg.name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = false

  tags = {
    "ResourceType" = "Azure Container Registry"
    "environment"  = "test"
  }
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version 
  location            = var.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  dns_prefix          = var.cluster_name

  default_node_pool {
    name                = "system"
    node_count          = var.kubernetes_node_count
    vm_size             = "Standard_DS2_v2"
    type                = "VirtualMachineScaleSets"
    zones               = [1, 2, 3]
    enable_auto_scaling = false
    vnet_subnet_id      = var.subnet_name
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
      "environment" = "test"
  }
}