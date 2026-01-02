#-------------------
# Private End Point
#-------------------
variable "name" {
  description = "(Required) Specifies the Name of the Private Endpoint. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) Specifies the Name of the Resource Group within which the Private Endpoint should exist. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "(Required) The supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "subnet_id" {
  description = "(Required) The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created."
  type        = string
}

variable "custom_network_interface_name" {
  description = "(Optional) The custom name of the network interface attached to the private endpoint. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "private_dns_zone_group" {
  description = "(Optional) A private_dns_zone_group block"
  type        = any
  default     = {}
}

variable "private_service_connection" {
  description = "(Optional) A private_service_connection block"
  type        = any
  default     = {}
}

variable "ip_configuration" {
  description = "(Optional) One or more ip_configuration blocks. This allows a static IP address to be set for this Private Endpoint, otherwise an address is dynamically allocated from the Subnet."
  type        = any
  default     = {}
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}