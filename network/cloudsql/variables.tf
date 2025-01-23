variable "security_level" {
  type = string
  description = "Security level for the database. values manual = to use values as passed to variables, private = create within vpc, internal = firewall usage"
  default = "internal"
}

variable "project_id" {
  type        = string
  description = "The project to run tests against"
}

variable "network_name" {
  type        = string
  description = "Name of the vpc. Required if security level variable is set to private"
  default = ""
}

variable "private_access_config" {
  description = "The private_access_config settings for vpc private access"
  type = object({
    address                        = string
    prefix_length             = number
    ip_version                     = string
    labels                       = map(string)
  })
  default = {
    address = ""
    prefix_length = 16
    ip_version = ""
    labels = {}
  }
}