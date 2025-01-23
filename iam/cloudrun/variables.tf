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

variable "region" {
  description = "Google cloud region"
  type        = string
  default = ""
}

variable "with_vpc_connector" {
  description = "True or False if VPC Connector is used for cloud run"
  type        = bool
  default = false
}

//base module
variable "location" {
  description = "The location where resources are going to be deployed."
  type        = string
}

variable "kms_project_id" {
  description = "The project where kms keys are created"
  type        = string
  default = ""
}

variable "serverless_project_id" {
  description = "The project where cloud run is going to be deployed."
  type        = string
}

variable "vpc_project_id" {
  description = "The project where shared vpc is."
  type        = string
  default = ""
}


variable "connector_on_host_project" {
  description = "Connector is going to be created on the host project if true. When false, connector is going to be created on service project. For more information, access [documentation](https://cloud.google.com/run/docs/configuring/connecting-shared-vpc)."
  type        = bool
  default     = false
}