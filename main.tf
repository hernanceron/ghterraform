resource "azurerm_resource_group" "sample-k8s" {
  name = var.resource_group_name
  location = var.locationk8s
  tags = {
    "Environment" = "Development"    
  }
  
}

resource "azurerm_virtual_network" "sample-k8s-vnet" {
  name = var.virtual_network_name
  location = var.locationk8s
  address_space = [ "10.2.0.0/16" ]
  tags = {
    "Environment" = "Development"
  }
}

resource "azurerm_kubernetes_cluster" "k8s" {
    name                = var.cluster_name
    location            = var.locationk8s
    resource_group_name = var.resource_group_name
    dns_prefix          = var.dns_prefix

    linux_profile {
        admin_username = "ubuntu"

        ssh_key {
            key_data = var.ssh_public_key
        }
    }

    default_node_pool {
        name            = "default"
        node_count      = var.agent_count
        vm_size         = "Standard_B2s"
        os_disk_size_gb = 30
    }

    service_principal {
        client_id     = var.aks_service_principal_app_id
        client_secret = var.aks_service_principal_client_secret
    }

    tags = {
        Environment = "Development"
    }
}