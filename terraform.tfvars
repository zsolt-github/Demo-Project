# Azure main variables
az_resource_group_name  = "RG-AKS-TF"
az_location = "UKWest"

az_virtual_network_name = "VNET-AKS-TF"
az_virtual_network_address_space = "10.30.0.0/16"

az_subnet_name = "SN-AKS-TF"
az_subnet_address_prefix = "10.30.1.0/24"


# AKS
aks_cluster_name = "AKS-P2-TF"
aks_version = "1.25.2"
#1.24.6

#    Pool name must start with a lowercase letter, have max length of 12, and only have characters a-z0-9
aks_default_node_name = "system"
aks_default_node_count = 1
aks_default_node_vm_size = "Standard_B2s" # 2 vCPUs + 4GB RAM + 4 Data disks + 1280 IOPS - $30.37/month
#aks_default_node_vm_size = "Standard_B2ms" # 2 vCPUs + 8GB RAM + 4 Data disks + 1920 IOPS - $60.74/month
#aks_default_node_vm_size = "Standard_D2as_v4" # 2 vCPUs + 8GB RAM + 4 Data disks + 3200 IOPS - $70.08/month
#aks_default_node_vm_size = "Standard_B4ms" # 4 vCPUs + 16GB RAM + 8 Data disks + 2880 IOPS - $121.18/month
#aks_default_node_vm_size = "Standard_E2bds_v5" # 2 vCPUs + 16GB RAM + 4 Data disks + 5500 IOPS - $121.91/month
#aks_default_node_vm_size = "Standard_E4bds_v5" # 4 vCPUs + 21GB RAM + 8 Data disks + 11000 IOPS - $243.82/month
aks_default_node_node_type = "VirtualMachineScaleSets"

aks_worker_pool_1_name = "workerpool1"
# aks_worker_pool_1_vm_size = "Standard_B2s" # 2 vCPUs + 4GB RAM + 4 Data disks + 1280 IOPS - $30.37/month
aks_worker_pool_1_vm_size = "Standard_D2as_v4" # 2 vCPUs + 8GB RAM + 4 Data disks + 3200 IOPS - $70.08/month
#aks_worker_pool_1_vm_size =  "Standard_B4ms" # 4 vCPUs + 16GB RAM + 8 Data disks + 2880 IOPS - $121.18/month
aks_worker_pool_1_node_type = "VirtualMachineScaleSets"
aks_worker_pool_1_auto_scaling_min_count = "1"
aks_worker_pool_1_auto_scaling_max_count = "3"
aks_worker_pool_1_count = 1


# Azure Container Registry
acr_name = "zfcloudacr001"


# Jenkins
 jenkins_admin_user = "admin"
 jenkins_admin_password = "adminpassword11"