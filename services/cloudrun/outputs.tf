output "serverless_neg_id" {
    value = var.with_alb ? google_compute_region_network_endpoint_group.serverless_neg[0].id : ""
}