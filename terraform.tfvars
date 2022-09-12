# Azure main variables
az_resource_group_name  = "RG-AKS-TF"
az_location = "UKWest"

az_virtual_network_name = "VNET-AKS-TF"
az_virtual_network_address_space = "10.30.0.0/16"

az_subnet_name = "SN-AKS-TF"
az_subnet_address_prefix = "10.30.1.0/24"


aks_cluster_name = "AKS-P2-TF"
aks_version = "1.23.8"


# Pool name must start with a lowercase letter, have max length of 12, and only have characters a-z0-9
aks_default_node_name = "system"
aks_default_node_count = 1
aks_default_node_vm_size = "Standard_DS2_v2"
aks_default_node_node_type = "VirtualMachineScaleSets"

# Pool name must start with a lowercase letter, have max length of 12, and only have characters a-z0-9
aks_worker_pool_1_name = "workerpool1"
aks_worker_pool_1_vm_size = "Standard_DS2_v2"
aks_worker_pool_1_node_type = "VirtualMachineScaleSets"
aks_worker_pool_1_auto_scaling_max_count = "3"
aks_worker_pool_1_auto_scaling_min_count = "1"
aks_worker_pool_1_count = 1

acr_name = "zfcloudacr001"
