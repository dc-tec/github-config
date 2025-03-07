terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.106.0"
    }
  }
  required_version = "1.11.1"

  backend "azurerm" {
    resource_group_name  = "rg-dct-prd-westeu"
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
  homepage_url       = each.value[0].homepage_url
  features           = each.value[0].features
  merge_options      = each.value[0].merge_options
  gitignore_template = each.value[0].gitignore_template
  license_template   = each.value[0].license_template
  actions            = each.value[0].actions
  pages              = each.value[0].pages
  is_archived        = each.value[0].is_archived
}
