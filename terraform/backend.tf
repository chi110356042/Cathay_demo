terraform {
 backend "gcs" {
   bucket  = "chi110356042"
   prefix  = "terraform/state"
 }
}