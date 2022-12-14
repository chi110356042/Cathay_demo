output "taxonomy_id" {
  description = "Id of taxonomy"
  value       = google_data_catalog_taxonomy.new_taxonomy.id
}

output "policy_tag_id_contact" {
  description = "Id of tag"
  value       = google_data_catalog_policy_tag.basic_policy_tag_contact.id
  
}

output "policy_tag_id_crime" {
  description = "Id of tag"
  value       = google_data_catalog_policy_tag.basic_policy_tag_crime.id
}

output "policy_tag_id_sensitive" {
  description = "Id of tag"
  value       = google_data_catalog_policy_tag.basic_policy_tag_sensitive.id
}