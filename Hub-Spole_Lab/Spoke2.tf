resource "azurerm_virtual_network" "Spoke2" {
  name                = "Spoke2_VNet"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = [var.Spoke2_VNet_Space]
}

resource "azurerm_subnet" "Spoke2_Subnet" {
  name                 = "Spoke2_Subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.Spoke2.name
  address_prefixes     = [var.Spoke2_Subnet]
}

resource "azurerm_network_interface" "Spoke2_NIC" {
  name                = "Spoke2_VM_NIC"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "Spoke2_NIC"
    subnet_id                     = azurerm_subnet.Spoke2_Subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.2.0/24"
  }
}

resource "azurerm_linux_virtual_machine" "Spoke2_VM" {
  name                  = "Spoke2_VM"
  resource_group_name   = azurerm_resource_group.example.name
  location              = var.location
  size                  = "Standard_F2"
  admin_username        = "Spoke2"
  admin_password        = "Spoke1@123!"
  network_interface_ids = [azurerm_network_interface.Spoke2_NIC.id]

  os_disk {
    name                 = "Spoke2_OSDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 30
  }

  plan {
    name      = "UbuntuServer"
    publisher = "Canonical"
    product   = "UbuntuServer"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20_04-lts"
    version   = "latest"
  }

  disable_password_authentication = false
  computer_name                   = "spoke2vm"
}
