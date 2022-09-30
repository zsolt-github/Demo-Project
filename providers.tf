terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.20.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.13.1"
    }

    helm = {
      source = "hashicorp/helm"
      version = "2.6.0"
    }

  }
}

provider "azurerm" {
  features {}
}

/*
provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.aks.kube_config.0.host
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)
#  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
#  client_key             = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
}


provider "helm" {
  kubernetes {
#    host                      = var.aks_cluster_name
    host                      = data.azurerm_kubernetes_cluster.aks.kube_config.0.host
      cluster_ca_certificate  = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.host)
        exec {
          api_version = "client.authentication.k8s.io/v1beta1"
          args        = ["aks", "get-token", "--cluster-name", var.aks_cluster_name]
          command     = "az"
        }
    }
}
*/
