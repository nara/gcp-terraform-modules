locals {
  default_permissions = ["serviceusage.services.get", "serviceusage.services.list", "serviceusage.services.use",
      "resourcemanager.projects.get", "resourcemanager.projects.getIamPolicy", "compute.projects.get"]

  kms_permissions_read = [
    "cloudkms.cryptoKeyVersions.get",
    "cloudkms.cryptoKeyVersions.list",
    "cloudkms.cryptoKeys.get",
    "cloudkms.cryptoKeys.getIamPolicy",
    "cloudkms.cryptoKeys.list",
    "cloudkms.keyRings.get"]

  kms_permissions_write = [
    "cloudkms.cryptoKeyVersions.create",
    "cloudkms.cryptoKeyVersions.destroy",
    "cloudkms.cryptoKeys.create",
    "cloudkms.cryptoKeys.setIamPolicy",
    "cloudkms.cryptoKeys.update",
    "cloudkms.keyRings.create",
  ]

  secretmanager_permissions_read = [
    "secretmanager.secrets.get",
    "secretmanager.secrets.getIamPolicy",
    "secretmanager.secrets.list",
    "secretmanager.versions.access",
    "secretmanager.versions.get",
    "secretmanager.versions.list"
  ]

  secretmanager_permissions_write = [
    "secretmanager.secrets.create",
    "secretmanager.secrets.delete",
    "secretmanager.secrets.update",
    "secretmanager.versions.add",
    "secretmanager.versions.destroy",
    "secretmanager.versions.disable",
    "secretmanager.versions.enable",
    "secretmanager.secrets.setIamPolicy",
  ]

  netowrk_permissions_read = [
      "compute.subnetworks.get",
  ]

  vpc_permissions_write = [
      "compute.subnetworks.create",
      "compute.networks.updatePolicy",
      "compute.subnetworks.delete"
  ]

  loadbalancer_dns_read = [
      "dns.resourceRecordSets.get",
      "dns.managedZones.get",
      "compute.globalAddresses.get",
      "compute.globalAddresses.use",
      "compute.globalOperations.get",
      "compute.securityPolicies.get",
      "compute.securityPolicies.use",
      "compute.regionNetworkEndpointGroups.get",
      "compute.regionNetworkEndpointGroups.use",
      "compute.backendServices.get",
      "compute.backendServices.use",
      "compute.urlMaps.get",
      "compute.urlMaps.use",
      "compute.targetHttpProxies.get",
      "compute.targetHttpProxies.use",
      "compute.globalForwardingRules.get",
      "compute.regionOperations.get",
      "dns.resourceRecordSets.get",
      "dns.resourceRecordSets.list",
      "dns.responsePolicies.get",
      "dns.responsePolicies.list",
      "dns.responsePolicyRules.get",
      "dns.responsePolicyRules.list",
      "compute.sslCertificates.get",
      "compute.targetHttpsProxies.get",
      "compute.targetHttpsProxies.use"
  ]

  all_permissions_read = concat(local.default_permissions, (contains(var.capabilities, "kms") ? local.kms_permissions_read : []),
    (contains(var.capabilities, "secretmanager") ? local.secretmanager_permissions_read : []),
    (contains(var.capabilities, "serverless_connector") ? local.netowrk_permissions_read : []),
    (contains(var.capabilities, "loadbalancer") ? local.loadbalancer_dns_read : []))
  
  security_permissions_write = concat( (contains(var.capabilities, "kms") ? local.kms_permissions_write : []),
    (contains(var.capabilities, "secretmanager") ? local.secretmanager_permissions_write : []))

  network_permissions_write = concat( (contains(var.capabilities, "secretmanager") ? local.secretmanager_permissions_write : []), 
    (contains(var.capabilities, "serverless_connector") ? local.vpc_permissions_write : []))

  db_permissions_write = concat( (contains(var.capabilities, "secretmanager") ? local.secretmanager_permissions_write : []))

  preglobal_permissions_write = concat( (contains(var.capabilities, "secretmanager") ? local.secretmanager_permissions_write : []))

  postglobal_permissions_write = concat( (contains(var.capabilities, "secretmanager") ? local.secretmanager_permissions_write : []))

  regional_permissions_write = concat( (contains(var.capabilities, "secretmanager") ? local.secretmanager_permissions_write : []))

  service_permissions_write = concat( (contains(var.capabilities, "serverless_connector") ? 
        ["compute.regionNetworkEndpointGroups.create", "compute.regionNetworkEndpointGroups.delete"] : []),
    (contains(var.capabilities, "cloudrun") ? ["run.services.create", "run.services.update", "run.services.get"] : []),
    (contains(var.capabilities, "secretmanager") ? local.secretmanager_permissions_write : []))

  
  global_permissions_write = concat( (contains(var.capabilities, "loadbalancer") ? 
        ["compute.globalAddresses.create", "compute.securityPolicies.create", 
        "compute.securityPolicies.delete", "compute.globalAddresses.delete", "compute.backendServices.create", 
        "compute.backendServices.setSecurityPolicy", "compute.backendServices.delete", "compute.urlMaps.create", "compute.urlMaps.delete",
        "compute.globalForwardingRules.create", "compute.globalForwardingRules.setLabels", 
        "compute.targetHttpProxies.create", "compute.targetHttpProxies.delete",
        "compute.globalForwardingRules.delete", "compute.targetHttpProxies.setUrlMap", 
        "compute.sslCertificates.create", "compute.sslCertificates.delete", 
        "compute.targetHttpsProxies.create", "compute.targetHttpsProxies.delete"] : []),
        (contains(var.capabilities, "secretmanager") ? local.secretmanager_permissions_write : []))
}