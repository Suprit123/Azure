resource "azurerm_virtual_network_peering" "Spoke1_to_Hub" {
  name                      = "Spoke1_to_Hub_Peering"
  resource_group_name       = azurerm_resource_group.example.name
  virtual_network_name      = azurerm_virtual_network.Spoke1.name
  remote_virtual_network_id = azurerm_virtual_network.Hub.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = true

}

resource "azurerm_virtual_network_peering" "Spoke2_to_Hub" {
  name                      = "Spoke2_to_Hub_Peering"
  resource_group_name       = azurerm_resource_group.example.name
  virtual_network_name      = azurerm_virtual_network.Spoke2.name
  remote_virtual_network_id = azurerm_virtual_network.Hub.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = true

}
