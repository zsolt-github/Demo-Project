# --- Variables for the Tags -------------------------

variable "bi-tags" {
  type        = map(string)
  description = "Tags used for the deployment"
}


# --- Variables for the Azure Resource Group -------------------------

variable "bi-location" {
    type        = string
    description = "Location of the resources in Azure."
    default     = "UKSouth"
}

variable "bi-resource_group_name" {
    type        = string
    description = "Resource Group name in Azure."
}


# --- Variables for the Azure Virtual Network -------------------------

variable "bi-virtual_network_name" {
    type        = string
    description = "Name of the VLAN in Azure."
}

variable "bi-virtual_network_address_space" {
    type        = string
    description = "The address space of the VLAN in Azure."
}


# --- Variables for Azure the Subnet -------------------------

variable "bi-subnets" {
  type = map(any)
}



# Variables for the Azure Storage Account(s) -------------------------

variable "bi-storage_accounts" {
  type = map(any)
}



# Variables for the Azure Storage Container(s) -------------------------

variable "bi-storage_containers" {
    type        = map(any)
}

/*
# Variables for the Azure Key Vault -------------------------

variable "bi-key_vault_name" {
    type        = string
    description = "Name of the Azure Key Vault."
}

variable "bi-key_vault_sku" {
    type        = string
    description = "SKU of the Azure Key Vault. (strandard or premium)"
    default     = "strandard"
}
*/


# Variables for Azure Log Analytics Workspaces -------------------------

variable "bi-laws" {
    type = map(any)
    description = "Azure Log Analytics Workspaces attributes."
}


/*
# --- Variables for the Azure Container Registry -------------------------

variable "bi-acr" {
    type = map(any)
    description = "Azure Container Registry attributes."
}
*/


/*
# Variables for the Bastion host public IP -------------------------

variable "bi-public_ips" {
    type        = map(any)
}


# Variables for the Azure Bastion Host -------------------------

variable "bi-bastion_host_name" {
  type        = string
  description = "The name of the basion host"
  #default     = "az-bastionhost"
}
*/ # ---
