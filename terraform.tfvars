subscription_id     = "8137c2f4-3363-4a3b-93f6-c6acd62fbd52"
resource_group_name = "PrimeSquare-IAC-Resource-Group"
location            = "Central India"
vnet_name           = "PrimeSquare-IAC-VNET"
subnet_name         = "PrimeSquare-IAC-subnet"
subnet_id           = "/subscriptions/8137c2f4-3363-4a3b-93f6-c6acd62fbd52/resourceGroups/PrimeSquare-IAC-Resource-Group/providers/Microsoft.Network/virtualNetworks/PrimeSquare-IAC-VNET/subnets/PrimeSquare-IAC-subnet"
nic_name            = "PrimeSquare-IAC-NIC"
nsg_name            = "PrimeSquare-IAC-NSG"
storage_account     = "demostatesa12"
storage_container   = "terraform-private-key"

vm_details = [
  {
    vm_name  = "PrimeSquare-IAC-VM"
    vm_count = 2
    vm_size  = "Standard_DS1_v2"
    disk_type = "Standard_LRS"
    os_disk_size = 32
    username = "azureuser"
    os_image = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-LTS"
      version   = "latest"
    }
  }
]

inbound_rules = [
  {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "111.93.10.210/32"
    destination_address_prefix = "*"
  },
  {
    name                       = "AllowHTTP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "111.93.10.210/32"
    destination_address_prefix = "*"
  }
]

outbound_rules = [
  {
    name                       = "AllowAllOut"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
]

tags = {
  Environment = "Development"
  Project     = "PrimeSquare-IAC"
}
