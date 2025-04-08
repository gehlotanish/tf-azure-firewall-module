variable "name" {
  description = "The name of the Azure Firewall."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the firewall."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the firewall. Possible values are AZFW_Hub and AZFW_VNet."
  type        = string
}

variable "sku_tier" {
  description = "The SKU tier of the firewall. Possible values are Standard, Premium, or Basic."
  type        = string
}

variable "threat_intel_mode" {
  description = "The mode of threat intelligence. Possible values are Off, Alert, Deny."
  type        = string
  default     = "Alert"
}

variable "firewall_policy_id" {
  description = "The ID of the Firewall Policy to associate with the firewall."
  type        = string
  default     = null
}

variable "private_ip_ranges" {
  description = "List of private IP address ranges (CIDRs)."
  type        = list(string)
  default     = []
}

variable "dns_servers" {
  description = "List of custom DNS servers."
  type        = list(string)
  default     = []
}

variable "ip_configurations" {
  description = <<EOT
List of IP configuration maps with:
  - name
  - subnet_id
  - public_ip_address_id
EOT
  type = list(object({
    name                 = string
    subnet_id            = string
    public_ip_address_id = string
  }))
}

variable "management_ip_configuration" {
  description = <<EOT
Management IP configuration block:
  - name
  - subnet_id
  - public_ip_address_id
EOT
  type = object({
    name                 = string
    subnet_id            = string
    public_ip_address_id = string
  })
  default = null
}

variable "zones" {
  description = "List of availability zones."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
