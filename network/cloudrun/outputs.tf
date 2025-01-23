output "connector_ids" {
  value = module.serverless_connector.connector_ids
  description = "VPC serverless connector ID."
}

output "vpc_connector_name" {
  value = module.naming_conv.serverless_vpc_connector_name
}