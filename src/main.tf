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

  backend "azurerm" {
    resource_group_name  = "rg-terraform-prod-westeu-001"
    storage_account_name = "dcttfbackendprod001"
    container_name       = "tfstate"
    key                  = "github/terraform.tfstate"
  }
}

resource "github_user_gpg_key" "roelc" {
  armored_public_key = <<EOT
    -----BEGIN PGP PUBLIC KEY BLOCK-----

    mDMEZmtltRYJKwYBBAHaRw8BAQdAP9GeHEmTYq7TETlJddK8UAFKQEynjUBin576
    9A5tSkq0H1JvZWwgZGUgQ29ydCA8cm9lbEBkZWNvcnQudGVjaD6IkwQTFgoAOxYh
    BFwE9iLk/ZFNXir2cd7Q55TnDA9/BQJma2W1AhsDBQsJCAcCAiICBhUKCQgLAgQW
    AgMBAh4HAheAAAoJEN7Q55TnDA9/MPYBAMp38iF23ChYGtyVWWfKJx2PAV0OqulR
    OM7kkFC9/l/wAPsHUhY+NRJQ9koEgEPKgl1G/C+fjaE9wL2wNoMSOQqPC7g4BGZr
    ZbUSCisGAQQBl1UBBQEBB0AHBX9V0YtANSXLrsu0nEew7RhUQleXZsTBxuKuFPDu
    JQMBCAeIeAQYFgoAIBYhBFwE9iLk/ZFNXir2cd7Q55TnDA9/BQJma2W1AhsMAAoJ
    EN7Q55TnDA9/imUA/2jsly1WH88+Br6nuCQ2oEhg9eprr/nYJ3sGdqscdRpIAP0U
    jYUXQQDroWairb25YshrZ/W87/EVeuivlamtUjOeCw==
    =g13U
    -----END PGP PUBLIC KEY BLOCK-----
    EOT
}

resource "github_user_ssh_key" "roelc" {
  title = "Roel de Cort"
  key   = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHQ7HSO8O+R1NoKTzdcqWrANt0przSD6ucWqY9G/tJN9"
}

resource "github_user_ssh_key" "argocd" {
  title = "ArgoCD"
  key   = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBDI8+6Ks3U+KCpW3O2Pbg8OB0cx12jXA9cNSR533WUT"

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
