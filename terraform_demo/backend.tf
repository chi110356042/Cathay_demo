terraform {
 backend "gcs" {
   bucket  = "terraform_demo_final"
   prefix  = "terraform/state"
 }
}