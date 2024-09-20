terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }

  required_version = "~> 1.9.5"

  backend "azurerm" {
    resource_group_name  = "s194d00-dfe-secure-by-design-docs_rg"
    storage_account_name = "tfstatepfqk89"
    container_name       = "tfstate"
    key                  = "sbd.tfstate"
  }
}

provider "azurerm" {
    subscription_id = "32591f22-8209-4c82-a65c-618b967e7bff"
  features {}
}

locals {
  resource_group = "s194d00-dfe-secure-by-design-docs_rg"
  tags = {
    "Product"          = "Protective Monitoring - Splunk SaaS"
    "Environment"      = "Dev"
    "Service Offering" = "dfe-secure-by-design-docs"
  }

}

resource "azurerm_resource_group" "dfe_secure_by_design_docs_rg" {
  name     = local.resource_group
  location = "West Europe"
  tags     = local.tags
}

resource "random_string" "sbd_resource_code_sg" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_storage_account" "tfstate" {
  name                            = "tfstate${random_string.sbd_resource_code_sg.result}"
  resource_group_name             = azurerm_resource_group.dfe_secure_by_design_docs_rg.name
  location                        = azurerm_resource_group.dfe_secure_by_design_docs_rg.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false
  min_tls_version                 = "TLS1_2"
  tags                            = local.tags
  #infrastructure_encryption_enabled = true
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}

resource "azurerm_storage_account" "dfe-secure-by-design-docs-storage" {
  name                       = "dfesbddocs${random_string.sbd_resource_code_sg.result}"
  resource_group_name        = azurerm_resource_group.dfe_secure_by_design_docs_rg.name
  location                   = azurerm_resource_group.dfe_secure_by_design_docs_rg.location
  account_kind               = "StorageV2"
  account_tier               = "Standard"
  account_replication_type   = "LRS"
  min_tls_version            = "TLS1_2"
  https_traffic_only_enabled = true

  static_website {
    index_document     = "index.html"
    error_404_document = "404.html"
  }

  tags = local.tags
}

resource "azurerm_storage_blob" "dfe-secure-by-design-docs-blob-index" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.dfe-secure-by-design-docs-storage.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = "../site/index.html"
}

resource "azurerm_storage_blob" "dfe-secure-by-design-docs-blob-404" {
  name                   = "404.html"
  storage_account_name   = azurerm_storage_account.dfe-secure-by-design-docs-storage.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = "../site/404.html"
}

output "storage_account_primary_web_host" {
  description = "primary web host"
  value       = azurerm_storage_account.dfe-secure-by-design-docs-storage.primary_web_host
}
output "storage_account_name" {
  description = "storage account name"
  value       = azurerm_storage_account.dfe-secure-by-design-docs-storage.name
}


resource "azurerm_dns_cname_record" "dfe-secure-by-design-docs-cname" {
  name                = "secure-by-design"
  zone_name           = "security.education.gov.uk"
  resource_group_name = "s194d00-security-dns"
  ttl                 = 60 # 3600 (raise once working)
  target_resource_id = azurerm_cdn_endpoint.secure-by-design-cdn-endpoint.id

  # Spaces in tags not allowed for cname records
  tags = {
    "Product"          = "Protective Monitoring - Splunk SaaS"
    "Environment"      = "Dev"
    "ServiceOffering"  = "dfe-secure-by-design-docs"
  }
}

resource "azurerm_cdn_profile" "secure-by-design-cdn-profile" {
  name                = "sbd-security-education-gov-uk-cdnprofile"
  resource_group_name = azurerm_resource_group.dfe_secure_by_design_docs_rg.name
  location            = azurerm_resource_group.dfe_secure_by_design_docs_rg.location
  sku                 = "Standard_Microsoft"
  tags                = local.tags
}

resource "azurerm_cdn_endpoint" "secure-by-design-cdn-endpoint" {
  name                = "sbd-security-education-gov-uk-cdnendpoint"
  profile_name        = azurerm_cdn_profile.secure-by-design-cdn-profile.name
  resource_group_name = azurerm_resource_group.dfe_secure_by_design_docs_rg.name
  location            = azurerm_resource_group.dfe_secure_by_design_docs_rg.location
  is_http_allowed     = false
  is_https_allowed    = true
  tags                = local.tags

  origin {
    name      = "contentOrigin"
    host_name = azurerm_storage_account.dfe-secure-by-design-docs-storage.primary_web_host
  }

  origin_host_header = azurerm_storage_account.dfe-secure-by-design-docs-storage.primary_web_host

  delivery_rule {
    name  = "EnforceHTTPS"
    order = "1"

    request_scheme_condition {
      operator     = "Equal"
      match_values = ["HTTP"]
    }

    url_redirect_action {
      redirect_type = "Found"
      protocol      = "Https"
    }
  }
}