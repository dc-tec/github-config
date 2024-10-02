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

resource "github_user_gpg_key" "roelc_darwin" {
  armored_public_key = <<EOT
     -----BEGIN PGP PUBLIC KEY BLOCK-----

    mQINBGbeGJQBEACa2gs0jQrsk/wqjB0JXqi/GUEvB2VhAMV5qoaFRkaOx1LmZ7vT
    5RPGL1uGTnPp+Wz1VYai2jhGGweGiSXYg99ZvSRumP+OMPhc+SkasfWMHYeVxvdB
    YO7+g20J3b88G/8WSAFnVk3ekY+VeHJLe8vDotV2atEKAkS1ccHETfm/ssT6YWK8
    QlSQw36pRUntnSCAeaLCm5szIBiPy/4hH8amo9Fv1WXRm9g6xZ6uc5uNBlHBhq5F
    UcEhkJoGBLr7gUQOeuUqfyzd0ThcoCw5KLdhFPdb4Y0l93HNkfNN+Q/EDbitbrgm
    eHUkBN84OlHmJ1N+LWoAc43HHkHLgk3HqgYFvmpx4lelGZaDyGU3nJJCQ8Zr2Eiz
    y7iljPHGTTpZ8ozCdQ9lIxu+jrUzRPXI1yLp8WgZtntowDaqv6fGiryLeMpr4RwA
    /aemPWHwxSIGZX624NrzGhBhqSlxLEI1mfM2SURxoDH72XxtU9jGkAqoNbQtpLHV
    K9qEBrCFplRccW3Tlxbkiy8AnR6dzOP/BEn7xLIK2Ca2tCjK2+MKrd+zl316ukGq
    Rt/6xeupZuGVITpF9MweOUh/RAn9vs6MNJPxvtBgZ5BxCWufTY1jpy28AMWpLjKE
    3ZWxmKuDfAeGC9pYZb9bdwzzIczIFyY5t6u+8xDjX8NogDFQMFyP3BiN7QARAQAB
    tB9Sb2VsIGRlIENvcnQgPHJvZWxAZGVjb3J0LnRlY2g+iQJXBBMBCABBFiEE+Vyr
    8LfVTYCH/5s+Mh6tH8PFGWEFAmbeGJQCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsC
    BBYCAwECHgcCF4AACgkQMh6tH8PFGWEs6Q//XcfIuOjZT/VS50I/MldssPWId10G
    vP6hA1ilTXtqqsN2Mhof6GcNMdI6Lziwy47McL1QOevwvJc9hmTe2gD5c3W3xwZj
    GxYZ+hi6C4YAnHbvz6fQXtgpuwfe9oBehfmVQk5Y73pP09eVsgxLIvHtDTYAhauh
    J45uGoSZ0/yyL/qdw6iYlaKewOcXQXlQFtpbieX2wIzmLFFckb3Efx4dpGv21MiS
    Uazgfqj8+9D1rVQ+gCYnzVYAiqmSHEwTOXD7s5YNz0MKUHFnqawDtxhqVVM/ePQb
    s32pRhAjNMvWQ9nqGWRHFuZXiPYR5pz5zzdv7MzYNnmSCBw8MqnHUUS89t5+EL2u
    /1iYyxfgxfivBRfHhk2i6q+vdqhAU2qgn+8SlSDX6PinqFp6q6hf4yOeL042fhM8
    /99t2jgwr8e1+hY7xT9S7aSjAfowhZ2UtV+ym7mJyhP4NyYQhYSiX7Z1QVDCq6nv
    geemUn69en494PXXLZQQPvJW4L7kDikf6o9CXa63pzdFB7rfhvZAGVuTK8Ys9qdi
    ptZDl/K/VyqSj2P/t2yLLNQbpJV1Av5snc599vskZ30NsgjuICe2Pb11xhPfFb8y
    GaVu85zDEmctN3zXWkjhQ77Nr8QGz+m2gUqgp5byC4B+gMXTI9A7ZJ9IfkiC/2Aa
    azhifA4h2GwV/4U=
    =XsQ3
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
