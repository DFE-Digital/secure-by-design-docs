output "storage_account_primary_web_host" {
  description = "primary web host"
  value       = azurerm_storage_account.dfe-secure-by-design-docs-storage.primary_web_host
}
output "storage_account_name" {
  description = "storage account name"
  value       = azurerm_storage_account.dfe-secure-by-design-docs-storage.name
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.dfe_secure_by_design_docs_rg.name
}

output "cdn_profile_name" {
  description = "cdn profile name"
  value       = azurerm_cdn_profile.secure-by-design-cdn-profile.name
}

output "cdn_endpoint_name" {
  description = "cdn endpoint name"
  value       = azurerm_cdn_endpoint.secure-by-design-cdn-endpoint.name
}