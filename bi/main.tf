locals {
  #public_ips-bastion = { for name, ip in var.bi-public_ips : name => ip if name == "bastion" }

  # One way of filtering out the 'Bastion' IP is to not use the other two
  #public_ips-bastion = { for name, ip in var.bi-public_ips : name => ip if name != "lb" && name != "vm" }
}


# Test this resource instead of or paralell with 'random_id'
# https://learn.microsoft.com/en-us/azure/key-vault/keys/quick-create-terraform?tabs=azure-cli
resource "random_string" "azurerm_key_vault_name" {
  length  = 4
  lower   = true
  numeric = false
  special = false
  upper   = false
}

resource "random_id" "random_storage" {
  for_each    = var.bi-storage_accounts
  byte_length = 4
  keepers     = {
    resource_group_id = azurerm_resource_group.azure-rg.id
  }

  depends_on = [azurerm_resource_group.azure-rg]
}

resource "random_id" "random_acr" {
  byte_length = 4
  keepers     = {
    resource_group_id = azurerm_resource_group.azure-rg.id
  }

  depends_on = [azurerm_resource_group.azure-rg]
}

resource "azurerm_resource_group" "azure-rg" {
  location = var.bi-location
  name     = var.bi-resource_group_name
  
  tags = var.bi-tags
}


resource "azurerm_virtual_network" "vnet" {
  name                = var.bi-virtual_network_name
  resource_group_name = azurerm_resource_group.azure-rg.name
  location            = var.bi-location
  address_space       = [var.bi-virtual_network_address_space]
  depends_on          = [azurerm_resource_group.azure-rg]

  tags = var.bi-tags
}


resource "azurerm_subnet" "subnets" {
  for_each             = var.bi-subnets
  resource_group_name  = azurerm_resource_group.azure-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  name                 = each.value["name"]
  address_prefixes     = each.value["address_prefix"]
}


resource "azurerm_storage_account" "storage_accounts" {
  for_each                        = var.bi-storage_accounts
  resource_group_name             = azurerm_resource_group.azure-rg.name
  location                        = azurerm_resource_group.azure-rg.location

  name                            = "${each.value["name"]}${lower(random_id.random_storage[each.key].hex)}"               
  account_tier                    = each.value["tier"]
  account_kind                    = each.value["kind"]
  account_replication_type        = each.value["rep_type"]
  enable_https_traffic_only       = each.value["https"]
  access_tier                     = each.value["access_tier"]
  min_tls_version                 = each.value["tls"]
  allow_nested_items_to_be_public = each.value["nested_pub"]
  public_network_access_enabled   = each.value["public_network_access"]
  default_to_oauth_authentication = each.value["azure_ad_auth"]

  tags = var.bi-tags
}

resource "azurerm_storage_container" "storage_conainers" {
  for_each              = var.bi-storage_containers
  name                  = each.value["name"]
  container_access_type = each.value["access_type"]
  storage_account_name  = azurerm_storage_account.storage_accounts[each.value["storage_account"]].name
}


/*
resource "azurerm_key_vault" "key_vault" {
  name                        = var.bi-key_vault_name
  # Test this:
  # name                       = coalesce(var.bi-key_vault_name, "vault-${random_string.azurerm_key_vault_name.result}")
  location                    = var.bi-location
  resource_group_name         = azurerm_resource_group.azure-rg.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = var.bi-key_vault_sku
  enable_rbac_authorization   = true
  enabled_for_deployment      = true
  enabled_for_disk_encryption = true
  purge_protection_enabled    = false
  #soft_delete_retention_days  = 7

  tags = var.bi-tags
}
*/

/*
resource "azurerm_key_vault_access_policy" "azure-key_vault_access_poicy-1" {
  key_vault_id = azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id
  depends_on   = [azurerm_key_vault.key_vault]

  key_permissions = [
    "Get",
    "List",
    "Update",
    "Create",
    "Import",
    "Delete",
    "Recover",
    "Backup",
    "Restore"
  ]

  secret_permissions = [
    "Get",
    "List",
    "Set",    
    "Delete",
    "Recover",
    "Backup",
    "Restore"
  ]

  certificate_permissions = [
    "Get",
    "List",
    "Update",
    "Create",
    "Import",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
  ]
}
*/

resource "azurerm_log_analytics_workspace" "laws" {
  for_each            = var.bi-laws
  name                = each.value["name"]
  location            = var.bi-location
  resource_group_name = azurerm_resource_group.azure-rg.name
  sku                 = each.value["sku"]
  retention_in_days   = each.value["retention_in_days"]
}

/*
resource "azurerm_container_registry" "acr" {
  name                = "${var.bi-acr.name}${lower(random_id.random_acr.hex)}"
  resource_group_name = azurerm_resource_group.azure-rg.name
  location            = var.bi-location
  sku                 = var.bi-acr.sku
  admin_enabled       = var.bi-acr.admin_enabled

  tags = var.bi-tags
}
*/
/* ---
resource "azurerm_public_ip" "public_ip-bastion" {
  for_each            = local.public_ips-bastion
  name                = each.value["name"]
 #name                = var.bi-bastion_public_ip_name
  location            = azurerm_resource_group.azure-rg.location
  resource_group_name = azurerm_resource_group.azure-rg.name
  allocation_method   = each.value["type"]
  sku                 = each.value["sku"]
  
  tags = var.bi-tags
}

resource "azurerm_bastion_host" "bastion" {
  name                = var.bi-bastion_host_name
  location            = azurerm_resource_group.azure-rg.location
  resource_group_name = azurerm_resource_group.azure-rg.name
  
  ip_configuration {
    name                 = "bastion_config"
    subnet_id            = azurerm_subnet.subnets["bastion_subnet"].id
    public_ip_address_id = azurerm_public_ip.public_ip-bastion["bastion"].id
  }

  tags = var.bi-tags
}
*/ # ---
