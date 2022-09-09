# Variables for the Resource Group

variable "resource_group_name" {
    type = string
    description = "Resource Group name in Azure"
}

variable "location" {
    type = string
    description = "Location of the resources in Azure"
}


# Variables for the Virtual Network

variable "virtual_network_name" {
    type = string
    description = "Name of the VLAN in Azure"
}

variable "virtual_network_address_space" {
    type = string
    description = "The address space of the VLAN in Azure"
}


# Variables for the Subnet

variable "subnet_name" {
    type = string
    description = "Name of the Subnet in Azure"
}

variable "subnet_address_prefix" {
    type = string
    description = "The address space of the Subnet in Azure"
}


# Variables for the Kubernetes Cluster

variable "k8s_cluster_name" {
    type = string
    description = "Name of the Kubernetes cluster in Azure"
}

variable "k8s_version" {
    type = string
    description = "Kubernetes version"
}


# Variables for the Kubernetes Default node

variable "k8s_default_node_name" {
    type = number
    description = "Name of Kubernetes default node"
}

variable "k8s_default_node_count" {
    type = number
    description = "Number of Kubernetes default node"
}

variable "k8s_default_node_vm_size" {
    type = string
    description = "VM type of Kubernetes default node"
}

variable "k8s_default_node_node_type" {
    type = string
    description = "Kubernetes Node Type of the default node"
}


# Variables for the Kubernetes Worker node 1

variable "k8s_worker_pool_1_name" {
    type = number
    description = "Name of Kubernetes worker node 1"
}

variable "k8s_worker_pool_1_vm_size" {
    type = string
    description = "VM type of Kubernetes worker node 1"
}

variable "k8s_worker_pool_1_node_type" {
    type = string
    description = "Kubernetes Node Type of the worker node 1"
}

variable "k8s_worker_pool_1_auto_scaling_max_count" {
    type = number
    description = "The maximum number of Kubernetes nodes in worker node 1"
}

variable "k8s_worker_pool_1_auto_scaling_min_count" {
    type = number
    description = "The minimum number of Kubernetes nodes in worker node 1"
}

variable "k8s_worker_pool_1_count" {
    type = number
    description = "Number of Kubernetes nodes in worker node 1"
}



# Variables for the Azure Container Registry

variable "acr_name" {
    type = string
    description = "Azure Container Registry name"  
}
