resource "azurerm_network_interface" "nicblock" {
for_each = var.nic
name = each.value.nic_name
location = each.value.nic_location
resource_group_name = each.value.nic_rg_name

ip_configuration {
name = "internal"
subnet_id = data.azurerm_subnet.frontend_subnet[each.key].id
public_ip_address_id = data.azurerm_public_ip.data_frontend_pip[each.key].id
private_ip_address_allocation = "Dynamic"
}
}