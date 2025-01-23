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

//base module
variable "location" {
  description = "The location where resources are going to be deployed."
  type        = string
}

variable "vpc_project_id" {
  description = "The project where shared vpc is."
  type        = string
}

variable "serverless_project_id" {
  description = "The project where cloud run is going to be deployed."
  type        = string
}

variable "subnet_name" {
  description = "Subnet name to be re-used to create Serverless Connector."
  type        = string
}

variable "shared_vpc_name" {
  description = "Shared VPC name which is going to be used to create Serverless Connector."
  type        = string
}

variable "connector_on_host_project" {
  description = "Connector is going to be created on the host project if true. When false, connector is going to be created on service project. For more information, access [documentation](https://cloud.google.com/run/docs/configuring/connecting-shared-vpc)."
  type        = bool
  default     = false
}

variable "ip_cidr_range" {
  description = "The range of internal addresses that are owned by the subnetwork and which is going to be used by VPC Connector. For example, 10.0.0.0/28 or 192.168.0.0/28. Ranges must be unique and non-overlapping within a network. Only IPv4 is supported."
  type        = string
}

variable "create_subnet" {
  description = "The subnet will be created with the subnet_name variable if true. When false, it will use the subnet_name for the subnet."
  type        = bool
  default     = true
}

variable "flow_sampling" {
  description = "Sampling rate of VPC flow logs. The value must be in [0,1]. Where 1.0 means all logs, 0.5 mean half of the logs and 0.0 means no logs are reported."
  type        = number
  default     = 1.0
}

variable "resource_names_suffix" {
  description = "A suffix to concat in the end of the resources names."
  type        = string
  default     = null
}