module "azurerm_resource_group" {
  source = "../child_module/azurerm_resource_group"
  rgs    = var.devrgs
}
module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  source     = "../child_module/azurerm_virtual_network"
  vnet       = var.devvnet
}
module "azurerm_subnet" {
  depends_on = [module.azurerm_resource_group, module.azurerm_virtual_network]
  source     = "../child_module/azurerm_subnet"
  snet       = var.devsnet
}
module "azurerm_network_security_group" {
  depends_on = [module.azurerm_resource_group]
  source     = "../child_module/azurerm_nsg"
  nsg        = var.devnsg
}
module "azurerm_subnet_network_security_group_association" {
  depends_on = [module.azurerm_resource_group, module.azurerm_network_security_group, module.azurerm_subnet]
  source     = "../child_module/nsg_subnet_association"
  nsgsub     = var.devnsgsub
}
module "azurerm_public_ip" {
  depends_on = [module.azurerm_resource_group, module.azurerm_subnet]
  source     = "../child_module/azurerm_public_ip"
  pip        = var.devpip
}
module "azurerm_nic" {
  depends_on = [module.azurerm_resource_group, module.azurerm_subnet, module.azurerm_public_ip]
  source     = "../child_module/azurerm_nic"
  nic        = var.devnic
}
module "azurerm_virtual_machine" {
  depends_on = [module.azurerm_subnet, module.azurerm_nic, module.azurerm_public_ip, module.azurerm_network_security_group]
  source     = "../child_module/azurerm_virtual_machine"
  vms        = var.devvms
}