resource "azurerm_public_ip" "public_ip" {
  name                = "public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "public_lb" {
  name                = var.public_lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration.name
    public_ip_address_id = azurerm_lb.public_lb.id
  }
}

resource "azurerm_lb_backend_address_pool" "public_lb_backend_pool" {
  name                = var.backend_pool_name
  loadbalancer_id     = azurerm_lb.public_lb.id
}

output "public_lb_id" {
  value = azurerm_lb.public_lb.id
}

output "public_lb_backend_pool_id" {
  value = azurerm_lb_backend_address_pool.public_lb_backend_pool.id
}

