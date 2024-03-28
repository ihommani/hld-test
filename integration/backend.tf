# Check values to be replaced in this repo action environment variables. Placeholders takes the name of the variable. TO REPLACE otherwise

terraform {
  backend "gcs" {
    bucket                      = "INT_TF_SAC_NAME"
    prefix                      = "terraform/"
    impersonate_service_account = "hld-int-lvsite-sac-terraform@hld-int-lvsite-prj-lvmh-com.iam.gserviceaccount.com"
  }
}