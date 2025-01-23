module "postgresql-db" {
  count   = var.db_type == "postgres" ? 1 : 0
  source  = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version = "11.0.0"

  activation_policy                = var.activation_policy
  additional_databases             = var.additional_databases
  additional_users                 = var.additional_users
  availability_type                = var.availability_type
  backup_configuration             = var.backup_configuration
  create_timeout                   = var.create_timeout
  database_flags                   = var.database_flags
  database_version                 = var.database_version
  db_charset                       = var.db_charset
  db_collation                     = var.db_collation
  db_name                          = var.db_name
  delete_timeout                   = var.delete_timeout
  deletion_protection              = var.deletion_protection
  disk_autoresize                  = var.disk_autoresize
  disk_autoresize_limit            = var.disk_autoresize_limit
  disk_size                        = var.disk_size
  disk_type                        = var.disk_type
  enable_default_db                = var.enable_default_db
  enable_default_user              = var.enable_default_user
  encryption_key_name              = var.encryption_key_name
  iam_user_emails                  = var.iam_user_emails
  insights_config                  = var.insights_config
  ip_configuration                 = var.ip_configuration
  maintenance_window_day           = var.maintenance_window_day
  maintenance_window_hour          = var.maintenance_window_hour
  maintenance_window_update_track  = var.maintenance_window_update_track
  module_depends_on                = var.module_depends_on
  name                             = module.naming_conv.cloud_sql_instance_name
  pricing_plan                     = var.pricing_plan
  project_id                       = var.project_id
  random_instance_name             = var.random_instance_name
  read_replica_deletion_protection = var.read_replica_deletion_protection
  read_replica_name_suffix         = var.read_replica_name_suffix
  read_replicas                    = var.read_replicas
  region                           = var.region
  tier                             = var.tier
  update_timeout                   = var.update_timeout
  user_labels                      = var.user_labels
  user_name                        = var.user_name
  user_password                    = var.user_password
  zone                             = var.zone
  
}

module "mysql-db" {
  count   = var.db_type == "mysql" ? 1 : 0
  source  = "GoogleCloudPlatform/sql-db/google//modules/mysql"
  version = "11.0.0"

  activation_policy                = var.activation_policy
  additional_databases             = var.additional_databases
  additional_users                 = var.additional_users
  availability_type                = var.availability_type
  backup_configuration             = var.backup_configuration
  create_timeout                   = var.create_timeout
  database_flags                   = var.database_flags
  database_version                 = var.database_version
  db_charset                       = var.db_charset
  db_collation                     = var.db_collation
  db_name                          = var.db_name
  delete_timeout                   = var.delete_timeout
  deletion_protection              = var.deletion_protection
  disk_autoresize                  = var.disk_autoresize
  disk_autoresize_limit            = var.disk_autoresize_limit
  disk_size                        = var.disk_size
  disk_type                        = var.disk_type
  enable_default_db                = var.enable_default_db
  enable_default_user              = var.enable_default_user
  encryption_key_name              = var.encryption_key_name
  ip_configuration                 = var.ip_configuration
  maintenance_window_day           = var.maintenance_window_day
  maintenance_window_hour          = var.maintenance_window_hour
  maintenance_window_update_track  = var.maintenance_window_update_track
  module_depends_on                = var.module_depends_on
  name                             = var.name
  pricing_plan                     = var.pricing_plan
  project_id                       = var.project_id
  random_instance_name             = var.random_instance_name
  read_replica_deletion_protection = var.read_replica_deletion_protection
  read_replica_name_suffix         = var.read_replica_name_suffix
  read_replicas                    = var.read_replicas
  region                           = var.region
  tier                             = var.tier
  update_timeout                   = var.update_timeout
  user_labels                      = var.user_labels
  user_name                        = var.user_name
  user_password                    = var.user_password
  zone                             = var.zone
}

