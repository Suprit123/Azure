output "resource_group_id" {
  description = "id of the created resource group"
  value       = azurerm_resource_group.main.id
}

output "vnet_id" {
  description = "id of the created virtual network"
  value       = azurerm_virtual_network.main.id
}

output "vnet_address_space" {
  description = "address space of the vnet"
  value       = azurerm_virtual_network.main.address_space
}

output "web_subnet_id" {
  description = "id of the web subnet"
  value       = azurerm_subnet.web.id
}

output "app_subnet_id" {
  description = "id of the app subnet"
  value       = azurerm_subnet.app.id
}