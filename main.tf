resource "azurerm_firewall" "firewall" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  sku_tier            = var.sku_tier
  threat_intel_mode   = var.threat_intel_mode

  firewall_policy_id = var.firewall_policy_id
  private_ip_ranges  = var.private_ip_ranges
  dns_servers        = var.dns_servers
  tags               = var.tags

  dynamic "ip_configuration" {
    for_each = var.ip_configurations
    content {
      name                 = ip_configuration.value.name
      subnet_id            = ip_configuration.value.subnet_id
      public_ip_address_id = ip_configuration.value.public_ip_address_id
    }
  }

  dynamic "management_ip_configuration" {
    for_each = var.management_ip_configuration != null ? [1] : []
    content {
      name                 = var.management_ip_configuration.name
      subnet_id            = var.management_ip_configuration.subnet_id
      public_ip_address_id = var.management_ip_configuration.public_ip_address_id
    }
  }

  zones = var.zones
}

