data "azurerm_kubernetes_cluster" "data-aks" {
  name                = var.aks_cluster_name
  resource_group_name = var.az_resource_group_name
  depends_on          = [azurerm_kubernetes_cluster.aks]
}



/*
# This doesn't work well
data "terraform_remote_state" "aks" {
  depends_on  = [azurerm_kubernetes_cluster.data-aks]
  backend     = "local"

  config = {
    path = "kubeconfig"
    # path = "terraform.tfstate"
  }
}

data "azurerm_kubernetes_cluster" "aks" {
  name                = data.terraform_remote_state.aks.outputs.kubernetes_cluster_name
  resource_group_name = data.terraform_remote_state.aks.outputs.resource_group_name
}

*/