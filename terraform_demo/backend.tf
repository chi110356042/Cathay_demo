terraform {
  backend "gcs" {
    bucket  = "terraform_demo_1219"
    prefix  = "terraform/state"
  }
 }