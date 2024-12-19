resource "azurerm_storage_account" "san123" {
    name = "sanprajakta"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    account_tier = "Standard"
    public_network_access_enabled = true
    account_replication_type = "LRS"
  
}

resource "azurerm_storage_container" "data" {
    name = "data"
    storage_account_name = "sanprajakta"
    container_access_type = "private"

  
}

resource "azurerm_storage_blob" "blob" {
    name = "Hello.txt"
    storage_account_name = "sanprajakta"
    storage_container_name = "data"
    type = "Block"
    source = "Demo/Hello.txt"


  
}