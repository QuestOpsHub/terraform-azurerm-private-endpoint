#-------------------
# Private End Point
#-------------------
output "name" {
  description = "The Name of the Private Endpoint."
  value       = azurerm_private_endpoint.private_endpoint.id
}

output "id" {
  description = "The ID of the Private Endpoint."
  value       = azurerm_private_endpoint.private_endpoint.id
}

output "network_interface" {
  description = "A network_interface block"
  value       = azurerm_private_endpoint.private_endpoint.network_interface
}

output "custom_dns_configs" {
  description = "A custom_dns_configs block"
  value       = azurerm_private_endpoint.private_endpoint.custom_dns_configs
}

output "private_dns_zone_configs" {
  description = "A private_dns_zone_configs block"
  value       = azurerm_private_endpoint.private_endpoint.private_dns_zone_configs
}

output "ip_configuration" {
  description = "A ip_configuration block"
  value       = azurerm_private_endpoint.private_endpoint.ip_configuration
}