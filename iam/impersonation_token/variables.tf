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

variable "vpc_postfix" {
  description = "VPC postfix for naming."
  type = string
  default = "01"
}

variable "region" {
  description = "Google cloud region"
  type        = string
  default = ""
}

variable "db_type" {
  description = "Type of database for cloud sql"
  type = string
  default = "pg"
}

variable "token_for" {
  description = "Value used for SA name. Has to be one of the values case sensitive (security, network, global, cloudsql, service) that map to automation SAs"
  type = string
}

variable "project_id" {
  description = "Project Id where SA exists"
  type = string
}

variable "token_lifetime" {
  description = "Project Id where SA exists"
  type = string
  default = "500s"
}