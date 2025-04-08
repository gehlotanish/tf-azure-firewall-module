# template-terraform
Template repository for all terraform module repositories

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.25.0 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.25.0 |
## Modules

No modules.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | List of custom DNS servers. | `list(string)` | `[]` | no |
| <a name="input_firewall_policy_id"></a> [firewall\_policy\_id](#input\_firewall\_policy\_id) | The ID of the Firewall Policy to associate with the firewall. | `string` | `null` | no |
| <a name="input_ip_configurations"></a> [ip\_configurations](#input\_ip\_configurations) | List of IP configuration maps with:<br>  - name<br>  - subnet\_id<br>  - public\_ip\_address\_id | <pre>list(object({<br>    name                 = string<br>    subnet_id            = string<br>    public_ip_address_id = string<br>  }))</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region to deploy the firewall. | `string` | n/a | yes |
| <a name="input_management_ip_configuration"></a> [management\_ip\_configuration](#input\_management\_ip\_configuration) | Management IP configuration block:<br>  - name<br>  - subnet\_id<br>  - public\_ip\_address\_id | <pre>object({<br>    name                 = string<br>    subnet_id            = string<br>    public_ip_address_id = string<br>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Azure Firewall. | `string` | n/a | yes |
| <a name="input_private_ip_ranges"></a> [private\_ip\_ranges](#input\_private\_ip\_ranges) | List of private IP address ranges (CIDRs). | `list(string)` | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU name of the firewall. Possible values are AZFW\_Hub and AZFW\_VNet. | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU tier of the firewall. Possible values are Standard, Premium, or Basic. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_threat_intel_mode"></a> [threat\_intel\_mode](#input\_threat\_intel\_mode) | The mode of threat intelligence. Possible values are Off, Alert, Deny. | `string` | `"Alert"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | List of availability zones. | `list(string)` | `[]` | no |  
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_id"></a> [firewall\_id](#output\_firewall\_id) | The ID of the Azure Firewall. |
| <a name="output_firewall_name"></a> [firewall\_name](#output\_firewall\_name) | The name of the Azure Firewall. |
| <a name="output_firewall_private_ip"></a> [firewall\_private\_ip](#output\_firewall\_private\_ip) | The private IP address of the first IP configuration. |
<!-- END_TF_DOCS -->

## Usage

```tfvars
name                = "my-azure-firewall"
location            = "eastus"
resource_group_name = "my-resource-group"
sku_name            = "AZFW_VNet"
sku_tier            = "Standard"
threat_intel_mode   = "Alert"

firewall_policy_id  = null  # Or set to the policy ID if you have one
private_ip_ranges   = ["10.0.0.0/8", "192.168.0.0/16"]
dns_servers         = ["8.8.8.8", "8.8.4.4"]

ip_configurations = [
  {
    name                 = "ipconfig1"
    subnet_id            = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/my-resource-group/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/AzureFirewallSubnet"
    public_ip_address_id = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/my-resource-group/providers/Microsoft.Network/publicIPAddresses/my-public-ip"
  }
]

management_ip_configuration = {
  name                 = "mgmt-ipconfig"
  subnet_id            = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/my-resource-group/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/AzureFirewallManagementSubnet"
  public_ip_address_id = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/my-resource-group/providers/Microsoft.Network/publicIPAddresses/my-management-public-ip"
}

zones = ["1", "2", "3"]

tags = {
  environment = "dev"
  owner       = "your-name"
}

```
