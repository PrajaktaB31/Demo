terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "Prajakta"
    storage_account_name = "sanprajakta"
    container_name = "data"
    key = "dev.terraform.tfstate"    
  }
}

provider "azurerm" {


  client_id       = var.client_id       # The Application (client) ID
  client_secret   = var.client_secret   # The client secret you created
  tenant_id       = var.tenant_id       # The Directory (tenant) ID
  subscription_id = var.subscription_id # Your Azure subscription ID
  
  features {}
}

