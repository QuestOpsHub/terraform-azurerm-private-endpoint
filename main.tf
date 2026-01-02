#-------------------
# Private End Point
#-------------------
resource "azurerm_private_endpoint" "private_endpoint" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  subnet_id                     = var.subnet_id
  custom_network_interface_name = try(var.custom_network_interface_name, null)

  dynamic "private_dns_zone_group" {
    for_each = try(var.private_dns_zone_group, {}) != {} ? [var.private_dns_zone_group] : []
    content {
      name                 = private_dns_zone_group.value.name
      private_dns_zone_ids = private_dns_zone_group.value.private_dns_zone_ids
    }
  }

  private_service_connection {
    name                              = var.private_service_connection.name
    is_manual_connection              = var.private_service_connection.is_manual_connection
    private_connection_resource_id    = lookup(var.private_service_connection, "private_connection_resource_id", null)
    private_connection_resource_alias = lookup(var.private_service_connection, "private_connection_resource_alias", null)
    subresource_names                 = lookup(var.private_service_connection, "subresource_names", [])
    request_message                   = var.private_service_connection.is_manual_connection == true ? lookup(var.private_service_connection, "request_message", null) : null
  }

  dynamic "ip_configuration" {
    for_each = length(keys(try(var.ip_configuration, {}))) > 0 ? try(var.ip_configuration, {}) : {}
    content {
      name               = ip_configuration.value.name
      private_ip_address = ip_configuration.value.private_ip_address
      subresource_name   = lookup(ip_configuration.value, "subresource_name", null)
      member_name        = lookup(ip_configuration.value, "member_name", null)
    }
  }

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["creation_timestamp"],
      private_service_connection,
    ]
  }
}