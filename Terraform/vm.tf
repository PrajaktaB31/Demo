resource "virtual_network_interface" "nic-p" {
  name                = "nic-p1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetp1.id
    private_ip_address_allocation = "Dynamic"

  }
}

resource "azurerm_virtual_machine" "vm-praju" {
  name                = "vm-praju1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "standard_F2"
  admin_username      = "Praju2331"
  admin_password      = "Praju@2331"
  network_interface_ids = [
    azurerm_network_interface.nic-p.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016=Datacenter"
    version   = "latest"
  }
}
