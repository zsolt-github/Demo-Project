location = "UKWest"

resource_group_name  = "RG-K8s-TF"

virtual_network_name = "VNET-K8s-TF"
virtual_network_address_space = "10.30.0.0/16"

subnet_name = "SN-K8s-TF"
subnet_address_prefix = "10.30.1.0/24"


k8s_cluster_name = "K8s-P2-TF"
k8s_version = "1.23.8"

k8s_default_node_name = "System"
k8s_default_node_count = 1
k8s_default_node_vm_size = "Standard_DS2_v2"
k8s_default_node_node_type = "VirtualMachineScaleSets"

k8s_worker_pool_1_name = "Worker Node - 1"
k8s_worker_pool_1_vm_size = "Standard_DS2_v2"
k8s_worker_pool_1_node_type = "VirtualMachineScaleSets"
k8s_worker_pool_1_auto_scaling_max_count = "3"
k8s_worker_pool_1_auto_scaling_min_count = "1"
k8s_worker_pool_1_count = 1

acr_name = "zfcloudacr001"
