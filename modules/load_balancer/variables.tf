variable "public_lb_name" {
  description = "The name of the public load balancer"
  type        = string
}

variable "frontend_ip_configuration" {
  description = "The frontend IP configuration for the public load balancer"
  type        = object({
    name                 = string
    public_ip_address_id = string
  })
}

variable "backend_pool_name" {
  description = "The name of the backend pool for the load balancer"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

