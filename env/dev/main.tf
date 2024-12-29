module "vm" {
  source              = "../../modules/vm"
  vmss_name           = "dev-web-vmss"
  location            = var.location
  resource_group_name = var.resource_group_name
  vm_count            = 3
  admin_username      = "adminuser"
  admin_password      = "Password123!"
}

module "load_balancer" {
  source              = "../../modules/load-balancer"
  lb_name             = "dev-web-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "nsg" {
  source              = "../../modules/nsg"
  nsg_name            = "dev-web-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}
