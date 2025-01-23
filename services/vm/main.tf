module "compute_instance" {
  count = var.create_mig ? 0 : 1
  source              = "terraform-google-modules/vm/google//modules/compute_instance"
  region              = var.region
  zone                = var.zone
  subnetwork          = var.subnetwork
  num_instances       = var.num_instances
  hostname            = var.hostname
  instance_template   = module.instance_template.self_link
  deletion_protection = var.deletion_protection
  access_config = var.access_config
  static_ips = var.static_ips
  alias_ip_ranges = var.alias_ip_ranges
}


module "instance_template" {
  source          = "terraform-google-modules/vm/google//modules/instance_template"
  name_prefix     = "${var.hostname}-instance-template"
  project_id      = var.project_id
  machine_type    = var.machine_type
  tags            = var.tags
  labels          = var.labels
  startup_script  = var.startup_script
  metadata        = var.metadata
  service_account = var.service_account

  /* network */
  network            = var.network
  subnetwork         = var.subnetwork
  subnetwork_project = var.subnetwork_project
  can_ip_forward     = var.can_ip_forward

  /* image */
  source_image         = var.source_image
  source_image_family  = var.source_image_family
  source_image_project = var.source_image_project

  /* disks */
  disk_size_gb     = var.disk_size_gb
  disk_type        = var.disk_type
  disk_labels      = var.disk_labels
  auto_delete      = var.auto_delete
  additional_disks = var.additional_disks
}

module "mig" {
  count = var.create_mig ? 1 : 0
  source                    = "terraform-google-modules/vm/google//modules/mig"
  project_id                = var.project_id
  hostname                  = var.hostname
  region                    = var.region
  instance_template         = module.instance_template.self_link
  target_size               = var.target_size
  target_pools              = var.target_pools
  distribution_policy_zones = var.distribution_policy_zones
  update_policy             = var.update_policy
  named_ports               = var.named_ports

  /* health check */
  health_check = var.health_check
  health_check_name = var.health_check_name

  /* autoscaler */
  autoscaling_enabled          = var.autoscaling_enabled
  max_replicas                 = var.max_replicas
  min_replicas                 = var.min_replicas
  cooldown_period              = var.cooldown_period
  autoscaling_cpu              = var.autoscaling_cpu
  autoscaling_metric           = var.autoscaling_metric
  autoscaling_lb               = var.autoscaling_lb
  autoscaling_scale_in_control = var.autoscaling_scale_in_control
}
