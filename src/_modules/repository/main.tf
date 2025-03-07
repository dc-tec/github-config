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
}
