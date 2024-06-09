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
}
