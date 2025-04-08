output "firewall_id" {
  value       = azurerm_firewall.firewall.id
  description = "The ID of the Azure Firewall."
}

output "firewall_name" {
  value       = azurerm_firewall.firewall.name
  description = "The name of the Azure Firewall."
}

output "firewall_private_ip" {
  value       = azurerm_firewall.firewall.ip_configuration[0].private_ip_address
  description = "The private IP address of the first IP configuration."
}

