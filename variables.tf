# --- Variables for the Azure Resource Group -------------------------

variable "az_resource_group_name" {
    type = string
    description = "Resource Group name in Azure."
}

variable "az_location" {
    type = string
    description = "Location of the resources in Azure."
}



# --- Variables for the Azure Virtual Network -------------------------

variable "az_virtual_network_name" {
    type = string
    description = "Name of the VLAN in Azure."
}

variable "az_virtual_network_address_space" {
    type = string
    description = "The address space of the VLAN in Azure."
}



# --- Variables for Azure the Subnet -------------------------

variable "az_subnet_name" {
    type = string
    description = "Name of the Subnet in Azure."
}

variable "az_subnet_address_prefix" {
    type = string
    description = "The address space of the Subnet in Azure."
}



# --- Variables for the Azure Kubernetes Cluster -------------------------

variable "aks_cluster_name" {
    type = string
    description = "Name of the Kubernetes cluster in Azure."
}

variable "aks_version" {
    type = string
    description = "Kubernetes version."
}



# --- Variables for the Azure Kubernetes System node -------------------------

variable "aks_system_node_name" {
    type = string
    description = "Name of Kubernetes system node."
}

variable "aks_system_node_count" {
    type = number
    description = "Number of Kubernetes system node."
}

variable "aks_system_node_vm_size" {
    type = string
    description = "VM type of Kubernetes system node."
}

variable "aks_system_node_node_type" {
    type = string
    description = "Kubernetes Node Type of the system node."
}

variable "aks_system_node_labels" {
    type = map(string)
    description = "Kubernetes Node Labels for the system node."
}



# --- Variables for the Azure Kubernetes Monitoring node -------------------------

variable "aks_monitoring_node_name" {
    type = string
    description = "Name of Kubernetes monitoring node."
}

variable "aks_monitoring_node_vm_size" {
    type = string
    description = "VM type of Kubernetes monitoring node."
}

variable "aks_monitoring_node_node_type" {
    type = string
    description = "Kubernetes Node Type of the monitoring node ."
}

variable "aks_monitoring_node_count" {
    type = number
    description = "Number of Kubernetes nodes in monitoring node."
}

variable "aks_monitoring_node_labels" {
    type = map(string)
    description = "Kubernetes Node Labels for the mointoring node."
}



# --- Variables for the Azure Kubernetes Worker node 1 -------------------------

variable "aks_worker_node_1_name" {
    type = string
    description = "Name of Kubernetes worker node 1."
}

variable "aks_worker_node_1_vm_size" {
    type = string
    description = "VM type of Kubernetes worker node 1."
}

variable "aks_worker_node_1_node_type" {
    type = string
    description = "Kubernetes Node Type of the worker node 1."
}

variable "aks_worker_node_1_auto_scaling_max_count" {
    type = number
    description = "The maximum number of Kubernetes nodes in worker node 1."
}

variable "aks_worker_node_1_auto_scaling_min_count" {
    type = number
    description = "The minimum number of Kubernetes nodes in worker node 1."
}

variable "aks_worker_node_1_count" {
    type = number
    description = "Number of Kubernetes nodes in worker node 1."
}

variable "aks_worker_node_1_labels" {
    type = map(string)
    description = "Kubernetes Node Labels for the mointoring node."
}



# --- Variables for the Azure Container Registry -------------------------

variable "acr_name" {
    type = string
    description = "Azure Container Registry name."
}



# --- Variables for Jenkins -------------------------

variable "jenkins_admin_user" {
  type        = string
  description = "Admin user of the Jenkins."
  default     = "admin"
}

variable "jenkins_admin_password" {
  type        = string
  description = "Admin password of the Jenkins."
}