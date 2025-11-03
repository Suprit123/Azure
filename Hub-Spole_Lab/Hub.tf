resource "azurerm_resource_group" "example" {
  name     = "Hub_Spoke_RG"
  location = var.location
}

resource "azurerm_virtual_network" "Hub" {
  name                = "Hub_VNet"
  address_space       = var.Hub_VNet_Space
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name

}

resource "azurerm_subnet" "Hub_Subnets" {
  for_each             = var.Hub_Subnets
  address_prefixes     = each.value
  name                 = each.key
  virtual_network_name = azurerm_virtual_network.Hub.name
  resource_group_name  = azurerm_resource_group.example.name
}

resource "azurerm_public_ip" "VNGW_PIP" {
  name                = "PIP01"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name

  allocation_method = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "NGW" {
  name                = "Hub_NGW"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = var.VNGW_Bool
  enable_bgp    = var.VNGW_Bool
  sku           = "VpnGw1"

  ip_configuration {
    name                 = "VNGW_Public_Ip"
    public_ip_address_id = azurerm_public_ip.VNGW_PIP.id
    subnet_id            = azurerm_subnet.Hub_Subnets["WEB"].id
  }
}
