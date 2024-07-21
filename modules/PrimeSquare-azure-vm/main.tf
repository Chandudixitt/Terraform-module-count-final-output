resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.nic_name}-${count.index+1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pubip[count.index].id
  }

  tags = var.tags
}

resource "azurerm_public_ip" "pubip" {
  count               = var.vm_count
  name                = "${var.public_ip_name}-${count.index+1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"

  tags = var.tags
}

#resource "azurerm_network_security_group" "nsg" {
#  name                = "${var.vm_name}-NSG"
#  location            = var.location
#  resource_group_name = var.resource_group_name
#
#  security_rule {
#    name                       = "Allow-SSH"
#    priority                   = 1001
#    direction                  = "Inbound"
#    access                     = "Allow"
#    protocol                   = "Tcp"
#    source_port_range          = "*"
#    destination_port_range     = "22"
#    source_address_prefix      = "*"
#    destination_address_prefix = "*"
#  }

#  tags = var.tags
#}

resource "azurerm_virtual_machine" "virtual_machine" {
  count                = var.vm_count
  name                 = "${var.vm_name}-${count.index+1}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  vm_size              = var.vm_size

  storage_os_disk {
    name              = "PrimeSquare-IAC-OsDisk-${count.index+1}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.os_disk_storage_account_type
  }

  storage_image_reference {
    publisher = var.os_image.publisher
    offer     = var.os_image.offer
    sku       = var.os_image.sku
    version   = var.os_image.version
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.username
  }

  os_profile_linux_config {
    disable_password_authentication = true
    
    ssh_keys {
      path     = "/home/${var.username}/.ssh/authorized_keys"
      key_data = var.ssh_public_key
    }
  }

  tags = var.tags
}

output "public_ip_addresses" {
  description = "The public IP addresses of the VMs"
  value       = azurerm_public_ip.pubip[*].ip_address
}

