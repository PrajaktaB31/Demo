resource "azurerm_network_interface" "ni-praju-2" {
  name                = "ni-praju-2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name


  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetp1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pubip-praju-linux.id
  }
}

resource "tls_private_key" "linux-pvt-key" {
    algorithm = "RSA"
    rsa_bits = 4096
  
}

resource "local_file" "limux-pem-key" {
    filename = "linux-pem-key.pem"
    content = tls_private_key.linux-pvt-key.private_key_pem
  
}

resource "azurerm_linux_virtual_machine" "linux-p" {
    name = "linux-m-p"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    size = "Standard_D2s_v3"
    admin_username = "prajakta"
   
    network_interface_ids = [ 
        azurerm_network_interface.ni-praju-2.id,
     ]

    admin_ssh_key {
    username   = "prajakta"
    public_key = tls_private_key.linux-pvt-key.public_key_openssh
  }

    os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}

resource "azurerm_public_ip" "pubip-praju-linux" {
  name = "pub-ip2"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Static"
  
}

resource "azurerm_managed_disk" "name-2" {
  name = "manageddisk-p2"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  storage_account_type = "Standard_LRS"
  create_option  = "Empty"
  disk_size_gb = 16

}

resource "azurerm_virtual_machine_data_disk_attachment" "vmd-praju-2" {

managed_disk_id = azurerm_managed_disk.name-2.id
virtual_machine_id = azurerm_linux_virtual_machine.linux-p.id
lun = "0"
caching = "ReadWrite"

  
}


  
