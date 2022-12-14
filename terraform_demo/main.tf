resource "google_storage_bucket" "auto-expire" {
  name          = "auto-expiring-bucket_demo"
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

#Create data policy taxonomies
resource "google_data_catalog_taxonomy" "new_taxonomy" {
  provider = google-beta
  region = "us"
  display_name =  "terraform_demo"
  description = "terraform_demo"
  activated_policy_types = ["FINE_GRAINED_ACCESS_CONTROL"]
}

#Create data policy tags
resource "google_data_catalog_policy_tag" "basic_policy_tag_contact" {
  provider = google-beta
  taxonomy = google_data_catalog_taxonomy.new_taxonomy.id
  display_name = "contact data"
  description = "contact"
  
}

resource "google_data_catalog_policy_tag" "basic_policy_tag_crime" {
  provider = google-beta
  taxonomy = google_data_catalog_taxonomy.new_taxonomy.id
  display_name = "crime data"
  description = "crime"
 
}

resource "google_data_catalog_policy_tag" "basic_policy_tag_sensitive" {
  provider = google-beta
  taxonomy = google_data_catalog_taxonomy.new_taxonomy.id
  display_name = "sensitive user data"
  description = "sensitive"
 
}

#create bigquery table
resource "google_bigquery_dataset" "default" {
  dataset_id                  = "terraform_demo_table"
  location                    = "US"

  labels = {
    env = "terraform_demo"
  }
}

resource "google_bigquery_table" "default" {
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "terraform_demo"

  schema = <<EOF
[
  {
    "name": "int64_field_0",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "id",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "identity",
    "type": "STRING",
    "mode": "NULLABLE",
    "policyTags": {
        "names": [
          "${google_data_catalog_policy_tag.basic_policy_tag_sensitive.id}"
        ]
      }
  },
  {
    "name": "birth",
    "type": "DATE",
    "mode": "NULLABLE",
    "policyTags": {
        "names": [
          "${google_data_catalog_policy_tag.basic_policy_tag_sensitive.id}"
        ]
      }
  },
  {
    "name": "phone",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "region",
    "type": "STRING",
    "mode": "NULLABLE",
    "policyTags": {
        "names": [
          "${google_data_catalog_policy_tag.basic_policy_tag_sensitive.id}"
        ]
      }
  },
  {
    "name": "crime",
    "type": "BOOLEAN",
    "mode": "NULLABLE",
    "policyTags": {
        "names": [
          "${google_data_catalog_policy_tag.basic_policy_tag_crime.id}"
        ]
      }
  }
]
EOF

}