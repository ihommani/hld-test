# Check values to be replaced in this repo action environment variables. Placeholders takes the name of the variable. TO REPLACE otherwise

locals {
  default_labels = {
    lvmh_maison       = "TO_REPLACE"
    lvmh_application  = "TO_REPLACE"
    lvmh_environment  = "int"
    lvmh_cost_center  = "TO_REPLACE"
    lvmh_app_owner    = "TO_REPLACE"
    lvmh_msp          = "INT_TF_SAC_NAME"
    hld_cmdb          = "service-now"
    hld_repository    = "Replace by current repository name"
    hld_service_level = "bronze"
  }
}
provider "google" {
  impersonate_service_account = "igo@lvmh.com"

  default_labels = local.default_labels
}

provider "google-beta" {
  impersonate_service_account = "igo@lvmh.com"

  default_labels = local.default_labels
}