resource "azurerm_virtual_network" "Spoke1" {
  name                = "Spoke1"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = [var.Spoke1_VNet_Space]
}

resource "azurerm_subnet" "Spoke1_Subnet" {
  name                 = "Spoke1_Subnet"
  address_prefixes     = [var.Spoke1_Subnet]
  virtual_network_name = azurerm_virtual_network.Spoke1.name
  resource_group_name  = azurerm_resource_group.example.name
}

resource "azurerm_network_interface" "NIC" {
  name                = "Spoke1_VM_NIC"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "Spoke1_NIC"
    subnet_id                     = azurerm_subnet.Spoke1_Subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.4"
  }
}

resource "azurerm_linux_virtual_machine" "Spoke1_VM" {
  name                  = "Spoke1_VM"
  resource_group_name   = azurerm_resource_group.example.name
  location              = var.location
  size                  = "Standard_F2"
  admin_username        = "Spoke1"
  admin_password        = "Spoke1@123!"
  network_interface_ids = [azurerm_network_interface.NIC.id]

  os_disk {
    name                 = "Spoke1_OSDisk"
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
  computer_name                   = "spoke1vm"
}
