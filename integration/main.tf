# Check values to be replaced in this repo action environment variables. Placeholders takes the name of the variable. TO REPLACE otherwise

locals {
  host_project = "TO_REPLACE"
}




module "sql_db" {
  source = "github.com/lvmh-group-it/terraform-module-gcp-web-application//application_datastore/redis?ref=v1"

  host_project = local.host_project
}



module "cloudrun-services" {
  source = "github.com/lvmh-group-it/terraform-module-gcp-web-application//application_core?ref=v1"

  artifact_publisher = []
  host_project       = local.host_project
  secrets_accessors  = []
  viewers            = []
  revision_deployers = ["serviceAccount:igo@lvmh.com"]

  no_corporate_access = true

  cloud_run_tagged_image_name = "foo:latest"

  env_vars = {
    *

      
    DB_NAME          = module.sql_db.db_name
    DB_USER          = module.sql_db.db_user
    DB_PORT          = module.sql_db.db_port
    DB_INSTANCE_HOST = module.sql_db.db_instance_private_ip
    
  }

  # Partners NATed IP
  ips_whitelist = []
}