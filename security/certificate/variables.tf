variable "secret_name" {
  type = string
  description = "Secret name"
}

variable "label" {
  type = map(string)
  description = "labels to attach to secret"
  default = {}
}

variable "secret_data" {
  type = string
  description = "Secret data to store"
  sensitive = true
  default = ""
}