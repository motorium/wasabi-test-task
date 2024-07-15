terraform {
  required_providers {
    wasabi = {
      source = "terrabitz/wasabi"
      version = "4.1.3"
    }
  }
}

provider "wasabi" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key

  endpoints {
    sts = "https://sts.wasabisys.com"
    iam = "https://iam.wasabisys.com"
    s3  = "s3.us-east-1.wasabisys.com"
  }  
}