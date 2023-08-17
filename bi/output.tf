output "bi-resource_group_name" {
  value = azurerm_resource_group.azure-rg.name
}

output "bi-resource_group_location" {
  value = azurerm_resource_group.azure-rg.location
}

output "bi-virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

output "bi-subnet_ids" {
    value = {
        for id in keys(var.bi-subnets) : id => azurerm_subnet.subnets[id].id
    }
    description = "Map of all subnet names to their IDs."
}


output "bi-subnet_names" {
    value = {
        for n in keys(var.bi-subnets) : n => azurerm_subnet.subnets[n].name
    }
    description = "Map of all subnet names to their names."
}

/*
# To generate only a list of the subnet names
output "bi-subnet_names2" {
    value = values(azurerm_subnet.azure-subnets)[*].name
    description = "Lists of the subnet ID's."
}
*/

output "bi-storage_account_names" {
    value = {
        for n in keys(var.bi-storage_accounts) : n => azurerm_storage_account.storage_accounts[n].name
    }
    description = "Map of storage account keys and storage account names."
}

# To generate only a list of the subnet names
output "bi-storage_account_names2" {
    value = values(azurerm_storage_account.storage_accounts)[*].name
    description = "Lists of the subnet ID's."
}

output "bi-storage_account_names3" {
    value = {
        for sa in azurerm_storage_account.storage_accounts : sa.name => sa.id
    }
    description = "Map of storage account names and storage account ids."
}

output "bi-storage_account_boot_diagnostic_uris" {
    value = {
        for b in keys (var.bi-storage_accounts) : b => azurerm_storage_account.storage_accounts[b].primary_blob_endpoint
  }
    description = "List of the storage account boot diagnostic URIs."
}

output "bi-storage_container_names" {
    value = {
        for n in keys(var.bi-storage_containers) : n => azurerm_storage_container.storage_conainers[n].name
    }
    description = "List of the storage container names."
}

output "bi-storage_container_ids" {
    value = {
        for i in keys(var.bi-storage_containers) : i => azurerm_storage_container.storage_conainers[i].id
    }
    description = "List of the storage container names."
}

/* ---
output "bi-bastion_public_ip" {
  value = azurerm_public_ip.bastion_pubip.ip_address
  description = "Public IP of the bastion host"
}
*/ # ---

output "bi-storage_accounts" {
  value = azurerm_storage_account.storage_accounts
}

output "bi-storage_containers" {
  value = azurerm_storage_container.storage_conainers
}
/*
output "bi-key_vault_id" {
  value = azurerm_key_vault.key_vault.id
}
*/

output "bi-laws_id" {
  value = {
    for i in keys(var.bi-laws) : i => azurerm_log_analytics_workspace.laws[i].id
  }
}
/*
output "bi-acr_id" {
  value = azurerm_container_registry.acr.id
}

output "bi-acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}
*/
/* ---
output "bi-bastion_public_ip" {
  value       = azurerm_public_ip.bastion_pub_ip["bastion"]
  description = "The public IP of the bastion."
}
*/ # ---
