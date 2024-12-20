resource "azurerm_virtual_network" "vnet-praju" {
    name = "vnet-praju1"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    address_space = ["10.0.0.0/16"]
    dns_servers = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "subnetp1" {
        name = "subnetp1"
        resource_group_name = azurerm_resource_group.rg.name
        virtual_network_name = azurerm_virtual_network.vnet-praju.name
        address_prefixes = ["10.0.1.0/24"]

}

resource "azurerm_subnet" "subnetp2"{
    name = "subnetp2"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet-praju.name
    address_prefixes = ["10.0.2.0/24"]
    
}


  
