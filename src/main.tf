terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }
  }
  required_version = "1.8.4"

  ## For development, gonna be moved to a remote state
  backend "local" {
    path = "terraform.tfstate"
  }
}

