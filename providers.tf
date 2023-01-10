terraform {
    required_version = ">=1.0"

    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "3.37.0"
      }
      random = {
        source = "hashicorp/random"
        version = "~>3.0"
      }
    }
    backend "azurerm" {
      resource_group_name = "RG-TERRAFORM-HCA"
      storage_account_name = "sahcastorage"
      container_name = "tfstate"
      key = "codelab.microsoft.tfstate"
    }
}

provider "azurerm" {
  features {}
}