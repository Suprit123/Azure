resource "azurerm_route_table" "Spoke1_RouteTable" {
  name                = "Spoke1-RouteTable"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name

  route {
    name           = "Spoke2-Route_To_Hub"
    address_prefix = azurerm_virtual_network.Spoke2.address_space
    next_hop_type  = "VirtualNetworkGateway"
  }
}


resource "azurerm_subnet_route_table_association" "Spoke1_Subnet_Association" {
  subnet_id      = azurerm_subnet.Spoke1_Subnet.id
  route_table_id = azurerm_route_table.Spoke1_RouteTable.id

}


resource "azurerm_route_table" "Spoke2_RouteTable" {
  name                = "Spoke2-RouteTable"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name

  route {
    name           = "Spoke1-Route_To_Hub"
    address_prefix = azurerm_virtual_network.Spoke1.address_space
    next_hop_type  = "VirtualNetworkGateway"
  }
}


resource "azurerm_subnet_route_table_association" "Spoke2_Subnet_Association" {
  subnet_id      = azurerm_subnet.Spoke2_Subnet.id
  route_table_id = azurerm_route_table.Spoke2_RouteTable.id

}
