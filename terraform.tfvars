subscription_id     = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
resource_group_name = "PrimeSquare-IAC-Resource-Group"
location            = "Central India"
virtual_network_name = "PrimeSquare-IAC-VNET"

subnet_details = [
  { name = "PrimeSquare-IAC-app-subnet-1", address_prefix = "10.2.0.64/27" },
  { name = "PrimeSquare-IAC-app-subnet-2", address_prefix = "10.2.0.96/27" },
  { name = "PrimeSquare-IAC-kafka-subnet-1", address_prefix = "10.2.0.128/27" },
  { name = "PrimeSquare-IAC-kafka-subnet-2", address_prefix = "10.2.0.160/27" },
  { name = "PrimeSquare-IAC-web-subnet-1", address_prefix = "10.2.0.0/27" },
  { name = "PrimeSquare-IAC-web-subnet-2", address_prefix = "10.2.0.32/27" },
  { name = "PrimeSquare-IAC-zk-subnet-1", address_prefix = "10.2.0.192/27" },
  { name = "PrimeSquare-IAC-zk-subnet-2", address_prefix = "10.2.0.224/27" }
]

availability_set_details = [
  { name = "PrimeSquare-IAC-webserver-avset", fault_domain_count = 2, update_domain_count = 5 },
  { name = "PrimeSquare-IAC-appserver-avset", fault_domain_count = 2, update_domain_count = 5 },
  { name = "PrimeSquare-IAC-MSGserver-avset", fault_domain_count = 2, update_domain_count = 5 }
]

nic_name            = "PrimeSquare-IAC-NIC"
#nsg_name            = "PrimeSquare-IAC-NSG"
storage_account     = "primesquareiacdemosa"
storage_container   = "terraform-private-key"

vm_details = {
    "PrimeSquare-IAC-Web-1" = {
      vm_name      = "PrimeSquare-IAC-Web-1"
      vm_count     = 1
      vm_size      = "Standard_DS1_v2"
      disk_type    = "Standard_LRS"
      os_disk_size = 32
      username     = "azureuser"
      os_image = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-LTS"
        version   = "latest"
      }
    },
    "PrimeSquare-IAC-Web-2" = {
      vm_name      = "PrimeSquare-IAC-Web-2"
      vm_count     = 1
      vm_size      = "Standard_DS1_v2"
      disk_type    = "Standard_LRS"
      os_disk_size = 32
      username     = "azureuser"
      os_image = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-LTS"
        version   = "latest"
      }
    },
    "PrimeSquare-IAC-App-1" = {
      vm_name      = "PrimeSquare-IAC-App-1"
      vm_count     = 1
      vm_size      = "Standard_DS1_v2"
      disk_type    = "Standard_LRS"
      os_disk_size = 32
      username     = "azureuser"
      os_image = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-LTS"
        version   = "latest"
      }
    },
    "PrimeSquare-IAC-App-2" = {
      vm_name      = "PrimeSquare-IAC-App-2"
      vm_count     = 1
      vm_size      = "Standard_DS1_v2"
      disk_type    = "Standard_LRS"
      os_disk_size = 32
      username     = "azureuser"
      os_image = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-LTS"
        version   = "latest"
      }
    },
    "PrimeSquare-IAC-Kafka-1" = {
      vm_name      = "PrimeSquare-IAC-Kafka-1"
      vm_count     = 1
      vm_size      = "Standard_DS1_v2"
      disk_type    = "Standard_LRS"
      os_disk_size = 32
      username     = "azureuser"
      os_image = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-LTS"
        version   = "latest"
      }
    },
    "PrimeSquare-IAC-Kafka-2" = {
      vm_name      = "PrimeSquare-IAC-Kafka-2"
      vm_count     = 1
      vm_size      = "Standard_DS1_v2"
      disk_type    = "Standard_LRS"
      os_disk_size = 32
      username     = "azureuser"
      os_image = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-LTS"
        version   = "latest"
      }
    },
    "PrimeSquare-IAC-ZK-1" = {
      vm_name      = "PrimeSquare-IAC-ZK-1"
      vm_count     = 1
      vm_size      = "Standard_DS1_v2"
      disk_type    = "Standard_LRS"
      os_disk_size = 32
      username     = "azureuser"
      os_image = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-LTS"
        version   = "latest"
      }
    },
    "PrimeSquare-IAC-ZK-2" = {
      vm_name      = "PrimeSquare-IAC-ZK-2"
      vm_count     = 1
      vm_size      = "Standard_DS1_v2"
      disk_type    = "Standard_LRS"
      os_disk_size = 32
      username     = "azureuser"
      os_image = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-LTS"
        version   = "latest"
      }
    }
}

nsg_details = [
  {
    name          = "PrimeSquare-APP-NSG"
    inbound_rules = [
      {
        name              = "AllowallSsh"
        priority          = 100
        direction         = "Inbound"
        access            = "Allow"
        protocol          = "Tcp"
        source_port_range = "*"
        destination_port_range = "22"
        source_address_prefix = "*"
        destination_address_prefix = "*"
      },
      {
        name                    = "AllowHTTP"
        priority                = 200
        direction               = "Inbound"
        access                  = "Allow"
        protocol                = "Tcp"
        source_port_range       = "*"
        destination_port_range  = "*"
        source_address_prefix   = "*"
        destination_address_prefix = "*"
      }
    ]
    outbound_rules = [
      {
        name              = "default-outbound"
        priority          = 100
        direction         = "Outbound"
        access            = "Allow"
        protocol          = "*"
        source_port_range = "*"
        destination_port_range = "*"
        source_address_prefix = "*"
        destination_address_prefix = "*"
      }
    ]	
  },
  {
    name          = "PrimeSquare-KAFKA-NSG"
    inbound_rules = [
      {
        name              = "Allowssh"
        priority          = 200
        direction         = "Inbound"
        access            = "Allow"
        protocol          = "Tcp"
        source_port_range = "*"
        destination_port_range = "22"
        source_address_prefix = "*"
        destination_address_prefix = "*"
      }
    ]
    outbound_rules = [
      {
        name              = "default-outbound"
        priority          = 100
        direction         = "Outbound"
        access            = "Allow"
        protocol          = "*"
        source_port_range = "*"
        destination_port_range = "*"
        source_address_prefix = "*"
        destination_address_prefix = "*"
      }
    ]
  },
  {
    name          = "PrimeSquare-WEB-NSG"
    inbound_rules = [
      {
        name              = "Allowhttp"
        priority          = 300
        direction         = "Inbound"
        access            = "Allow"
        protocol          = "Tcp"
        source_port_range = "*"
        destination_port_range = "80"
        source_address_prefix = "*"
        destination_address_prefix = "*"
      },
      {
        name                    = "AllowSsh"
        priority                = 200
        direction               = "Inbound"
        access                  = "Allow"
        protocol                = "Tcp"
        source_port_range       = "*"
        destination_port_range  = "22"
        source_address_prefix   = "*"
        destination_address_prefix = "*"
      }
    ]
    outbound_rules = [
      {
        name              = "default-outbound"
        priority          = 100
        direction         = "Outbound"
        access            = "Allow"
        protocol          = "*"
        source_port_range = "*"
        destination_port_range = "*"
        source_address_prefix = "*"
        destination_address_prefix = "*"
      }
    ]
  },
  {
    name          = "PrimeSquare-ZK-NSG"
    inbound_rules = [
      {
        name              = "Allowhttp"
        priority          = 300
        direction         = "Inbound"
        access            = "Allow"
        protocol          = "Tcp"
        source_port_range = "*"
        destination_port_range = "80"
        source_address_prefix = "205.254.168.168/32"
        destination_address_prefix = "*"
      }
    ]
    outbound_rules = [
      {
        name              = "default-outbound"
        priority          = 100
        direction         = "Outbound"
        access            = "Allow"
        protocol          = "*"
        source_port_range = "*"
        destination_port_range = "*"
        source_address_prefix = "*"
        destination_address_prefix = "*"
      }
    ]
  }
]

public_lb_name = "PrimeSquare-IAC-public-web-lb"
health_probe_name        = "PrimeSquare-IAC-public-lb-health-probe"
probe_port               = 80
probe_protocol           = "Tcp"
load_balancing_rule_name = "public-lb-rule"
lb_rule_frontend_port    = 80
lb_rule_backend_port     = 80
lb_rule_protocol         = "Tcp"


internal_lb_name = "PrimeSquare-IAC-internal-app-lb"
internal_health_probe_name  = "PrimeSquare-IAC-internal-lb-health-probe"
internal_probe_port         = 80
internal_probe_protocol     = "Tcp"
internal_load_balancing_rule_name = "PrimeSquare-internal-lb-rule"
internal_lb_rule_frontend_port = 80
internal_lb_rule_backend_port = 80
internal_lb_rule_protocol   = "Tcp"


mysql_server_name = "primesquareiacmysqlserver"
administrator_login = "useradminprime"
administrator_password = "H@Sh1CoR3!"
backup_retention_days = 7
#geo_redundant_backup_enabled = "flase"

storage_account_name    = "primesquareiacsa"
account_tier            = "Standard"
account_replication_type = "LRS"
storage_container_name = "myiaccontainer"
container_access_type  = "private"

tags = {
  Environment = "Development"
  Project     = "PrimeSquare-IAC"
}
