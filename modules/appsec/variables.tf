variable "sec_contract_id" {
  type    = string
  default = "1-1NC95D"
}

variable "sec_group_id" {
  type    = string
  default = "19298"
}

variable "sec_hostnames" {
  type = list(string)
}

variable "sec_activation_contacts" {
  description = "Contacts for property activations"
  type        = list(string)
}

variable "sec_activation_notes" {
  type = string
}

variable "bot_transparent_detections" {
  description = "Map of Transparent Detection names and actions"
  type        = map(any)
}

variable "akamai_bot_categories" {
  description = "Map of Akamai Bot Category names and actions"
  type        = map(any)
}

variable "waf_attack_groups" {
  description = "Map of WAF Attack Groups and their actions"
  type        = map(any)
}