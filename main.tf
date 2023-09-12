# https://github.com/chgeuer/terraform_state_azure_workload_identity_federation
# https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/service_principal_oidc
# https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=azure-cli

terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "=2.23.0"
    }
  }

  backend "azurerm" {
    use_oidc             = true
    tenant_id            = "5f9e748d-300b-48f1-85f5-3aa96d6260cb"
    client_id            = "fdf939e2-e28a-4c33-a761-efa219ce9cc0"
    subscription_id      = "706df49f-998b-40ec-aed3-7f0ce9c67759"
    resource_group_name  = "tfstaterg"
    storage_account_name = "tfstatechgp"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azuread" {
  use_oidc               = true
  tenant_id              = "5f9e748d-300b-48f1-85f5-3aa96d6260cb"
  client_id              = "fdf939e2-e28a-4c33-a761-efa219ce9cc0"
  features {}
}

provider "azurerm" {
  tenant_id              = "5f9e748d-300b-48f1-85f5-3aa96d6260cb"
  client_id              = "fdf939e2-e28a-4c33-a761-efa219ce9cc0"
  subscription_id        = "706df49f-998b-40ec-aed3-7f0ce9c67759"
  features {}
}

resource "azurerm_storage_account" "example" {
  name                     = "stchgp123tf"
  resource_group_name      = "tfstaterg"
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
