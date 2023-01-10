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
  resource_group_name = azurerm_resource_group.sample-k8s.name
  address_space = [ "10.2.0.0/16" ]
  tags = {
    "Environment" = "Development"
  }
}

resource "azurerm_subnet" "sample-k8s-subnet" {
  name = var.subnet_name  
  address_prefixes = [ "10.2.0.0/24"]
  resource_group_name = azurerm_resource_group.sample-k8s.name
  virtual_network_name = azurerm_virtual_network.sample-k8s-vnet.name
  
}

resource "azurerm_container_registry" "sample-acr" {
  name = "acrhcasamplega"
  resource_group_name = azurerm_resource_group.sample-k8s.name
  location = azurerm_resource_group.sample-k8s.location
  sku = "Standard"
}

resource "azurerm_kubernetes_cluster" "k8s" {
    name                = var.cluster_name
    location            = azurerm_resource_group.sample-k8s.location
    resource_group_name = azurerm_resource_group.sample-k8s.name
    dns_prefix          = var.dns_prefix
   
    default_node_pool {
        name            = "default"
        node_count      = var.agent_count
        vm_size         = "Standard_B2s"
        os_disk_size_gb = 30
    }

    identity {
      type = "SystemAssigned"
    }
   
    tags = {
        Environment = "Development"
    }
}

resource "azurerm_role_assignment" "example-role" {
  principal_id = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope = azurerm_container_registry.sample-acr.id
  skip_service_principal_aad_check = true
  
}