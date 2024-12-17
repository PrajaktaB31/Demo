terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

provider "azurerm" {
  
  client_id       = "99bc65a9-de0e-4ade-be0d-023b75cd24ff"          # The Application (client) ID
  client_secret   = "AGj8Q~T_qMt1sgJN~NeqBL5HN52pR4WfP5SRNbsR"      # The client secret you created
  tenant_id       = "9a128383-d5fd-4e73-8dad-0e259974404d"          # The Directory (tenant) ID
  subscription_id = "245d07e8-356d-4a77-8586-59f669ebffcf"    # Your Azure subscription ID
  features {}
}

