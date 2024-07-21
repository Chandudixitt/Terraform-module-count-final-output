variable "vm_name" {
  description = "The name of the VM"
  type        = string
}

variable "vm_size" {
  description = "The size of the VM"
  type        = string
}

variable "username" {
  description = "The admin username of the VM"
  type        = string
}

#variable "password" {
#  description = "The admin password of the VM"
#  type        = string
#}

variable "os_image" {
  description = "The OS image to use for the VM"
  type        = map(string)
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "nic_name" {
  description = "The name of NIC"
  type        = string
}

variable "public_ip_name" {
  description = "The name of the publicip"
  type        = string
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(any)
}

variable "vm_count" {
  description = "The number of VMs to create"
  type        = number
}

variable "ssh_public_key" {
  description = "SSH public key for VMs"
  type        = string
}

variable "os_disk_storage_account_type" {
  description = "(Optional) Specifies the storage account type of the os disk of the virtual machine"
  default     = "Standard_LRS"
  type        = string
}

