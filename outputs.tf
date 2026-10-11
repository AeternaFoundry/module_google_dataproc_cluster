output "dataproc_clusters_id" {
  description = "Map of id values across all dataproc_clusters, keyed the same as var.dataproc_clusters except keys with no id are omitted"
  value       = { for k, v in google_dataproc_cluster.dataproc_clusters : k => v.id if v.id != null && length(v.id) > 0 }
}
output "dataproc_clusters_cluster_config" {
  description = "Map of cluster_config values across all dataproc_clusters, keyed the same as var.dataproc_clusters except keys with no cluster_config are omitted"
  value       = { for k, v in google_dataproc_cluster.dataproc_clusters : k => one(v.cluster_config) if v.cluster_config != null && length(v.cluster_config) > 0 }
}
output "dataproc_clusters_deletion_policy" {
  description = "Map of deletion_policy values across all dataproc_clusters, keyed the same as var.dataproc_clusters except keys with no deletion_policy are omitted"
  value       = { for k, v in google_dataproc_cluster.dataproc_clusters : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "dataproc_clusters_effective_labels" {
  description = "Map of effective_labels values across all dataproc_clusters, keyed the same as var.dataproc_clusters except keys with no effective_labels are omitted"
  value       = { for k, v in google_dataproc_cluster.dataproc_clusters : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "dataproc_clusters_graceful_decommission_timeout" {
  description = "Map of graceful_decommission_timeout values across all dataproc_clusters, keyed the same as var.dataproc_clusters except keys with no graceful_decommission_timeout are omitted"
  value       = { for k, v in google_dataproc_cluster.dataproc_clusters : k => v.graceful_decommission_timeout if v.graceful_decommission_timeout != null && length(v.graceful_decommission_timeout) > 0 }
}
output "dataproc_clusters_labels" {
  description = "Map of labels values across all dataproc_clusters, keyed the same as var.dataproc_clusters except keys with no labels are omitted"
  value       = { for k, v in google_dataproc_cluster.dataproc_clusters : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "dataproc_clusters_name" {
  description = "Map of name values across all dataproc_clusters, keyed the same as var.dataproc_clusters except keys with no name are omitted"
  value       = { for k, v in google_dataproc_cluster.dataproc_clusters : k => v.name if v.name != null && length(v.name) > 0 }
}
output "dataproc_clusters_project" {
  description = "Map of project values across all dataproc_clusters, keyed the same as var.dataproc_clusters except keys with no project are omitted"
  value       = { for k, v in google_dataproc_cluster.dataproc_clusters : k => v.project if v.project != null && length(v.project) > 0 }
}
output "dataproc_clusters_region" {
  description = "Map of region values across all dataproc_clusters, keyed the same as var.dataproc_clusters except keys with no region are omitted"
  value       = { for k, v in google_dataproc_cluster.dataproc_clusters : k => v.region if v.region != null && length(v.region) > 0 }
}
output "dataproc_clusters_terraform_labels" {
  description = "Map of terraform_labels values across all dataproc_clusters, keyed the same as var.dataproc_clusters except keys with no terraform_labels are omitted"
  value       = { for k, v in google_dataproc_cluster.dataproc_clusters : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}
output "dataproc_clusters_virtual_cluster_config" {
  description = "Map of virtual_cluster_config values across all dataproc_clusters, keyed the same as var.dataproc_clusters except keys with no virtual_cluster_config are omitted"
  value       = { for k, v in google_dataproc_cluster.dataproc_clusters : k => one(v.virtual_cluster_config) if v.virtual_cluster_config != null && length(v.virtual_cluster_config) > 0 }
}

