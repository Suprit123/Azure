resource "azurerm_resource_group" "example" {
  name     = "NSG-RG"
  location = "EAST US"
}

resource "azurerm_network_security_group" "example" {
  name                = "Allow"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  dynamic "security_rule" {
    for_each = local.nsg_rules
    content {
      name                         = security_rule.key
      priority                     = security_rule.value.priority
      direction                    = "Inbound"
      access                       = "Allow"
      source_port_range            = "*"
      destination_port_range       = security_rule.value.destination_port_range
      source_address_prefix        = "*"
      destination_address_prefixes = "*"
      description                  = security_rule.value.description

    }
  }
}
