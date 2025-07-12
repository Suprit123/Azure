resource "azurerm_resource_group" "main" {
  name     = "main-rgp"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  count               = var.vnet_count
  name                = "vnet-${count.index + 1}"
  address_space       = [var.vnet_cidr[count.index]]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "subnet" {
  count                = var.subnet_count
  name                 = "subnet-${count.index + 1}"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.vnet[0].name
  address_prefixes     = [var.subnet_address_prefixes[count.index]]
}