data "terraform_remote_state" "aks" {
  depends_on  = [azurerm_kubernetes_cluster.aks]
  backend     = "local"

  config = {
    path = "terraform.tfstate"
  }
}

data "azurerm_kubernetes_cluster" "cluster" {
  name                = data.terraform_remote_state.aks.outputs.kubernetes_cluster_name
  resource_group_name = data.terraform_remote_state.aks.outputs.resource_group_name
}