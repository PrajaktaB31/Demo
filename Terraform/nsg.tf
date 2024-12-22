resource "azurerm_network_security_group" "name" {
    name = "nsg-p"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

  security_rule  {
    name = "Allow_HTTPS"
    priority = 2000
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_ranges = ["3389","22"]
    source_address_prefix = "*"
    destination_address_prefix = "*"


  }

  
}

resource "azurerm_subnet_network_security_group_association" "nsg-secasso-p" {
    subnet_id = azurerm_subnet.subnetp1.id
    network_security_group_id = azurerm_network_security_group.name.id

  
}