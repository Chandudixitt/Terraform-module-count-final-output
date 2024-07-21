terraform {
  backend "azurerm" {
    resource_group_name   = "demosatatergnew"
    storage_account_name  = "demostatesa1234"
    container_name        = "terraform-state-cont"
    key                   = "terraform.tfstate"
    use_msi               = true
    client_id             = "2b6ee24e-0e7a-4983-8a73-ae36c35f8bb0"
    access_key            = "Cy/sgBF2wo48rv3YivP6b3OFwAeATZ7BhDj6RbWKmTdxt3Ys7KP/HhH8S1X8NAtoncZLFDWaBSnR+ASt4GDhGw=="
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

module "network_security_group" {
  source                = "./modules/PrimeSquare-network_security_group"
  resource_group_name   = var.resource_group_name
  location              = var.location
  nsg_name              = var.nsg_name
  inbound_rules         = var.inbound_rules
  outbound_rules        = var.outbound_rules
  subnet_id             = var.subnet_id
  vm_count              = length(var.vm_details)
  tags                  = var.tags
}

resource "tls_private_key" "sshkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "vm" {
  source                       = "./modules/PrimeSquare-azure-vm"
  count                        = length(var.vm_details)
  vm_name                      = var.vm_details[count.index].vm_name
  vm_count                     = var.vm_details[count.index].vm_count
  vm_size                      = var.vm_details[count.index].vm_size
  username                     = var.vm_details[count.index].username
  os_disk_storage_account_type = var.vm_details[count.index].disk_type
  os_image                     = var.vm_details[count.index].os_image
  location                     = var.location
  resource_group_name          = var.resource_group_name
  subnet_id                    = var.subnet_id
  nic_name                     = var.nic_name
  public_ip_name               = var.public_ip_name
  ssh_public_key               = tls_private_key.sshkey.public_key_openssh
  tags                         = var.tags
}

