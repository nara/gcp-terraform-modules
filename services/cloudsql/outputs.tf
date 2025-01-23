output "master_connection" {
    value = var.db_type == "postgres" ? module.postgresql-db[0].instance_connection_name : null
}

output "ip_address" {
    value = var.db_type == "postgres" ? module.postgresql-db[0].instance_ip_address : null
}

output "self_link" {
    value = var.db_type == "postgres" ? module.postgresql-db[0].instance_self_link : null
}

output "standard_instance_name" {
    value = module.naming_conv.cloud_sql_instance_name
}