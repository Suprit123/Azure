output "vnet_foreach_id" {
  description = "id's for the vnet"
  value = azurerm_virtual_network.vnet_foreach
}

output "subnet_foreach_id" {
  description = "ids for the subnets"
  value = azurerm_subnet.subnet_foreach
}