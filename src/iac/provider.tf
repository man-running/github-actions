provider "aws" {
   # line below is used only when running locally not in pipelines
   #- shared_credentials_files = ["~/.aws/credentials"]
   # profile = "cicd"
   # line above removed and below substituted to support running in a pipeline with V4 AWS provider
   #- profile = var.in_pipeline ? "" : "cicd"
   # lines above with a dash have been commented out and replaced with the line below

   region = var.region
   # profile = "sso-session autom8"

   default_tags {
    tags = {
	    owner    = "Torchpaper"	
      iac  = "Terraform"
    }
   }
 }