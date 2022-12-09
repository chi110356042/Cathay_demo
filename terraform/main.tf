#Enabling API via Terraform
resource "google_project_service" "project_dl_services" {
  project = local.project_id
  for_each = toset(
    [
      "iam.googleapis.com",
      "serviceusage.googleapis.com",
      "datacatalog.googleapis.com",
      "bigquerydatapolicy.googleapis.com"
    ]
  )
  service                    = each.key
  disable_on_destroy         = false
  disable_dependent_services = true
  timeouts {
    create = "5m"
    update = "5m"
  }
}


resource "google_data_catalog_policy_tag" "basic_policy_tag" {
  provider = google-beta
  taxonomy = google_data_catalog_taxonomy.my_taxonomy.id
  display_name = "contact data"
  description = "contact"
}

#Create data policy tags
resource "google_data_catalog_policy_tag" "basic_policy_tag2" {
  provider = google-beta
  taxonomy = google_data_catalog_taxonomy.my_taxonomy.id
  display_name = "crime data"
  description = "crime"
}

resource "google_data_catalog_policy_tag" "basic_policy_tag3" {
  provider = google-beta
  taxonomy = google_data_catalog_taxonomy.my_taxonomy.id
  display_name = "sensitive user data"
  description = "sensitive"
}

#Create data policy taxonomies
resource "google_data_catalog_taxonomy" "my_taxonomy" {
  provider = google-beta
  project=local.project_id
  region = "us"
  display_name =  "1130"
  description = "test"
  activated_policy_types = ["FINE_GRAINED_ACCESS_CONTROL"]
}

resource "google_bigquery_datapolicy_data_policy" "pii_mask_default"{
        provider= google-beta
        project=local.project_id
        location="us"
        data_policy_id="pii_mask_default"
        policy_tag=google_data_catalog_policy_tag.basic_policy_tag.name
        data_policy_type="DATA_MASKING_POLICY"
        data_masking_policy{
          predefined_expression="DEFAULT_MASKING_VALUE"
        }
      }

resource "google_storage_bucket" "auto-expire" {
  name          = "auto-expiring-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
}
     




