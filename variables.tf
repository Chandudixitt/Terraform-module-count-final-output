variable "subscription_id" {
  description = "The name of the subscription id"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "vnet_name" {
  description = "The name of the VNET"
  type        = string
}


variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "nic_name" {
  description = "The name of the nic"
  type        = string
}

variable "nsg_name" {
  description = "The name of the Network Security Group"
  type        = string
}

variable "os_disk_storage_account_type" {
  description = "(Optional) Specifies the storage account type of the os disk of the virtual machine"
  default     = "Standard_LRS"
  type        = string
}

variable "public_ip_name" {
  description = "The name of the publicip"
  type        = string
}

variable "vm_details" {
  description = "Details of VMs to be created"
  type = list(object({
    vm_name     = string
    vm_size     = string
    vm_count    = number
    disk_type   = string
    username    = string
    os_image    = map(string)
  }))
}

variable "inbound_rules" {
  description = "Details of NSG rules to be created"
  type = list(object({
    name        = string
    priority    = number
    direction   = string
    access      = string
    protocol    = string
    source_port_range = string
    destination_port_range = string
    source_address_prefix = string
    destination_address_prefix = string
  }))
}

variable "outbound_rules" {
  description = "Details of outbound NSG rules to be created"
  type = list(object({
    name        = string
    priority    = number
    direction   = string
    access      = string
    protocol    = string
    source_port_range = string
    destination_port_range = string
    source_address_prefix = string
    destination_address_prefix = string
  }))
}

variable "tags" {
  type        = map(any)
  description = "Tags for the resources"
  default     = {
    Environment = "Development"
    Project     = "PrimeSquare-IAC"
  }
}

