data "azurerm_subnet" "frontend_subnet" {
for_each = var.nsgsub
name = each.value.subnet_name
virtual_network_name = each.value.virtual_network_name 
resource_group_name = each.value.resource_group_name
}
data "azurerm_network_security_group" "frontend_nsg" {
  for_each = var.nsgsub
  name                = each.value.network_security_group_name
  resource_group_name = each.value.resource_group_name
}