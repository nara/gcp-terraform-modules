variable "org_key" {
  description = "The organization 3 letter word"
  type        = string
}

variable "org_email_domain" {
  description = "The organization domain (e.g. example.com )"
  type        = string
}

variable "line_of_business_key" {
  description = "A 3 letter word for line of business that is unique in org"
  type        = string
}

variable "team_key" {
  description = "Opitonal. A 3 letter word for team managing the resources in this project"
  type        = string
  default = ""
}

variable "host_or_service_proj" {
  description = "Is this a host or service project. Accepted values host or svc"
  type        = string
  default = "host"
}

variable "app_key" {
  description = "A 3 letter app key that is unique in org"
  type        = string
}

variable "environment" {
  description = "A max 4 letter word explaining the environment the resources belong to. e.g. dev, qa, uat, stg, prod"
  type        = string
}

// service core
variable "with_alb" {
  description = "True if creating ALB to create NEg"
  type        = bool
  default = false
}

variable "allow_unauthenticated" {
  description = "allow public access to cloud run service"
  type = bool
  default = false
}

variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
}

variable "service_name" {
  description = "The name of the Cloud Run service to create"
  type        = string
}

variable "ingress_control" {
  type = string
  description = "possible values are internal, internalWithLb, all. Controls access to cloud run service based on this setting"
  default = ""
}

variable "region" {
  type        = string
  description = "The region of the Cloud SQL resources"
  default     = "us-central1"
}

variable "location" {
  description = "Cloud Run service deployment location"
  type        = string
}

variable "image" {
  description = "GCR hosted image URL to deploy"
  type        = string
}

variable "generate_revision_name" {
  type        = bool
  description = "Option to enable revision name generation"
  default     = true
}

variable "traffic_split" {
  type = list(object({
    latest_revision = bool
    percent         = number
    revision_name   = string
  }))
  description = "Managing traffic routing to the service"
  default = [{
    latest_revision = true
    percent         = 100
    revision_name   = "v1-0-0"
  }]
}

variable "service_labels" {
  type        = map(string)
  description = "A set of key/value label pairs to assign to the service"
  default     = {}
}

variable "service_annotations" {
  type        = map(string)
  description = "Annotations to the service. Acceptable values all, internal, internal-and-cloud-load-balancing"
  default = {
    "run.googleapis.com/ingress" = "all"
  }
}

// Metadata
variable "template_labels" {
  type        = map(string)
  description = "A set of key/value label pairs to assign to the container metadata"
  default     = {}
}

variable "template_annotations" {
  type        = map(string)
  description = "Annotations to the container metadata including VPC Connector and SQL. See [more details](https://cloud.google.com/run/docs/reference/rpc/google.cloud.run.v1#revisiontemplate)"
  default = {
    "run.googleapis.com/client-name"   = "terraform"
    "generated-by"                     = "terraform"
    "autoscaling.knative.dev/maxScale" = 2
    "autoscaling.knative.dev/minScale" = 1
  }
}

variable "encryption_key" {
  description = "CMEK encryption key self-link expected in the format projects/PROJECT/locations/LOCATION/keyRings/KEY-RING/cryptoKeys/CRYPTO-KEY."
  type        = string
  default     = null
}

// template spec
variable "container_concurrency" {
  type        = number
  description = "Concurrent request limits to the service"
  default     = null
}

variable "timeout_seconds" {
  type        = number
  description = "Timeout for each request"
  default     = 120
}

variable "service_account_email" {
  type        = string
  description = "Service Account email needed for the service"
  default     = ""
}

variable "volumes" {
  type = list(object({
    name = string
    secret = set(object({
      secret_name = string
      items       = map(string)
    }))
  }))
  description = "[Beta] Volumes needed for environment variables (when using secret)"
  default     = []
}

# template spec container
# resources
# cpu = (core count * 1000)m
# memory = (size) in Mi/Gi
variable "limits" {
  type        = map(string)
  description = "Resource limits to the container"
  default     = null
}
variable "requests" {
  type        = map(string)
  description = "Resource requests to the container"
  default     = {}
}

variable "ports" {
  type = object({
    name = string
    port = number
  })
  description = "Port which the container listens to (http1 or h2c)"
  default = {
    name = "http1"
    port = 8080
  }
}

variable "argument" {
  type        = list(string)
  description = "Arguments passed to the ENTRYPOINT command, include these only if image entrypoint needs arguments"
  default     = []
}

variable "container_command" {
  type        = list(string)
  description = "Leave blank to use the ENTRYPOINT command defined in the container image, include these only if image entrypoint should be overwritten"
  default     = []
}

variable "env_vars" {
  type = list(object({
    value = string
    name  = string
  }))
  description = "Environment variables (cleartext)"
  default     = []
}

variable "env_secret_vars" {
  type = list(object({
    name = string
    value_from = set(object({
      secret_key_ref = map(string)
    }))
  }))
  description = "[Beta] Environment variables (Secret Manager)"
  default     = []
}

variable "volume_mounts" {
  type = list(object({
    mount_path = string
    name       = string
  }))
  description = "[Beta] Volume Mounts to be attached to the container (when using secret)"
  default     = []
}

// Domain Mapping
variable "verified_domain_name" {
  type        = string
  description = "Custom Domain Name"
  default     = ""
}

variable "force_override" {
  type        = bool
  description = "Option to force override existing mapping"
  default     = false
}

variable "certificate_mode" {
  type        = string
  description = "The mode of the certificate (NONE or AUTOMATIC)"
  default     = "NONE"
}

variable "domain_map_labels" {
  type        = map(string)
  description = "A set of key/value label pairs to assign to the Domain mapping"
  default     = {}
}

variable "domain_map_annotations" {
  type        = map(string)
  description = "Annotations to the domain map"
  default     = {}
}

variable "members" {
  type        = list(string)
  description = "Users/SAs to be given invoker access to the service"
  default     = []
}