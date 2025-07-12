resource "azurerm_resource_group" "main" {
  name     = "main-rgp"
  location = var.location
}

resource "azurerm_virtual_network" "vnet_foreach" {
  for_each            = var.vnet_config
  name                = "vnet-${each.key}"
  address_space       = [each.value]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "subnet_foreach" {
  for_each             = var.subnet_config
  name                 = "subnet-${each.key}"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.vnet_foreach["prod"].name
  address_prefixes     = [each.value]
}