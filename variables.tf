variable "resource_group_name" {
    type = string
    description = "Resource Group name in Azure"
}

variable "location" {
    type = string
    description = "Location of the resources in Azure"
}

variable "virtual_network_name" {
    type = string
    description = "Name of the VLAN in Azure"
}

variable "virtual_network_address_space" {
    type = string
    description = "The address space of the VLAN in Azure"
}

variable "subnet_name" {
    type = string
    description = "Name of the Subnet in Azure"
}

variable "subnet_address_prefix" {
    type = string
    description = "The address space of the Subnet in Azure"
}

variable "cluster_name" {
    type = string
    description = "Name of the Kubernetes cluster in Azure"
}

variable "kubernetes_version" {
    type = string
    description = "Kubernetes version"
}

variable "kubernetes_node_count" {
    type = number
    description = "Number of Kubernetes worker nodes"
}

variable "acr_name" {
    type = string
    description = "Azure Container Registry name"  
}
