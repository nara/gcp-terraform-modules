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

variable "project_id" {
  description = "Project id on which the apis need enabling."
  type        = string
}

variable "app_key" {
  description = "A 3 letter app key that is unique in org"
  type        = string
}

variable "environment" {
  description = "A max 4 letter word explaining the environment the resources belong to. e.g. dev, qa, uat, stg, prod"
  type        = string
}

variable "apis" {
  type = list(string)
  description = "list of APIs"
}

variable "disable_dependent_services" {
  type = bool
  description = "to disable dependent services if this api is disabled"
  default = false
}

variable "disable_on_destroy" {
  type = bool
  description = "to disable this api on destroy"
  default = false
}

variable "timeouts" {
  description = "(Optional) How long certain operations are allowed to take before being considered to have failed."
  type        = map(string)
  default     = {}
}