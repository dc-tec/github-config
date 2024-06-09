terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.106.0"
    }
  }
  required_version = "1.8.5"

  ## For development, gonna be moved to a remote state
  backend "azurerm" {
    resource_group_name  = "rg-terraform-prod-westeu-001"
    storage_account_name = "dcttfbackendprod001"
    container_name       = "tfstate"
    key                  = "github/terraform.tfstate"
  }
}

module "repository" {
  source = "./_modules/repository"

  for_each = local.repositories

  repository_name    = each.value[0].name
  description        = each.value[0].description
  topics             = each.value[0].topics
  visibility         = each.value[0].visibility
  features           = each.value[0].features
  merge_options      = each.value[0].merge_options
  gitignore_template = each.value[0].gitignore_template
  license_template   = each.value[0].license_template
  actions            = each.value[0].actions
  is_archived        = each.value[0].is_archived

}
