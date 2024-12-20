resource "azurerm_network_interface" "ni-praju" {
  name                = "ni-praju"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name


  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetp1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pubip-praju.id
  }
}

resource "azurerm_windows_virtual_machine" "vm-praju" {
  name                = "vm-praju"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  availability_set_id = azurerm_availability_set.availab-p.id
  network_interface_ids = [
    azurerm_network_interface.ni-praju.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

}

resource "azurerm_public_ip" "pubip-praju" {
  name = "pub-ip1"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Static"
  
}

resource "azurerm_managed_disk" "name" {
  name = "manageddisk-p"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  storage_account_type = "Standard_LRS"
  create_option  = "Empty"
  disk_size_gb = 16

}

resource "azurerm_virtual_machine_data_disk_attachment" "vmd-praju" {

managed_disk_id = azurerm_managed_disk.name.id
virtual_machine_id = azurerm_windows_virtual_machine.vm-praju.id
lun = "0"
caching = "ReadWrite"

  
}
resource "azurerm_availability_set" "availab-p" {
  name = "Avail-p"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  platform_fault_domain_count = 3
  platform_update_domain_count = 3

}
