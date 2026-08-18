resource "azurerm_subnet_network_security_group_association" "nsgsubblock" {
for_each = var.nsgsub
  subnet_id                 = data.azurerm_subnet.frontend_subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.frontend_nsg[each.key].id
}