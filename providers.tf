terraform {
  required_providers {

    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.27.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.14.0"
    }

    helm = {
      source = "hashicorp/helm"
      version = "2.7.1"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }

  }
}

provider "azurerm" {
  features {}
}


provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.data-aks.kube_config.0.host
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.data-aks.kube_config.0.cluster_ca_certificate)
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.data-aks.kube_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.data-aks.kube_config.0.client_key)
}


provider "helm" {
  kubernetes {
  host                   = data.azurerm_kubernetes_cluster.data-aks.kube_config.0.host
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.data-aks.kube_config.0.cluster_ca_certificate)
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.data-aks.kube_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.data-aks.kube_config.0.client_key)
  }
}

provider "kubectl" {
  host                   = data.azurerm_kubernetes_cluster.data-aks.kube_config.0.host
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.data-aks.kube_config.0.cluster_ca_certificate)
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.data-aks.kube_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.data-aks.kube_config.0.client_key)
  load_config_file       = false
}