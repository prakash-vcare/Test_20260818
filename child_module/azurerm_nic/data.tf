data "azurerm_subnet" "frontend_subnet" {
for_each = var.nic
name = each.value.subnet_name
virtual_network_name = each.value.virtual_network_name 
resource_group_name = each.value.nic_rg_name
}
data "azurerm_public_ip" "data_frontend_pip" {
for_each = var.nic
name = each.value.pip_name
resource_group_name = each.value.nic_rg_name
}
