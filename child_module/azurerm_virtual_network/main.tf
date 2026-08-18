resource "azurerm_virtual_network" "vnet_block" {
for_each = var.vnet
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = ["172.0.0.0/16"]  
}