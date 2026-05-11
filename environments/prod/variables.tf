variable "edgerc_path" {
  type    = string
  default = "~/.edgerc"
}

variable "config_section" {
  type    = string
  default = "terraform"
}

variable "contract_id" {
  type    = string
  default = "ctr_1-1NC95D"
}

variable "group_id" {
  type    = string
  default = "grp_19298"
}

variable "activate_latest_on_staging" {
  type    = bool
  default = true
}

# variable "activate_latest_on_production" {
#   type    = bool
#   default = true
# }

variable "default_origin_hostname" {
  description = "Extracted from Terraform rules file"
  type        = string
}

variable "traffic_reporting_cp_code_id" {
  description = "Extracted from Terraform rules file"
  type        = number
}

# Edge Hostname Variables
variable "edge_hostnames" {
  description = "Edge hostnames configuration"
  type = map(object({
    ip_behavior   = string
    edge_hostname = string
    certificate   = number
  }))
}

# Property Configuration
variable "property_config" {
  description = "Property configuration parameters"
  type = object({
    name       = string
    product_id = string
  })
}

# Property Version Notes
variable "version_notes" {
  description = "Property version notes"
  type        = string
}

# Property Hostnames
variable "property_hostnames" {
  description = "Hostnames for the property"
  type = map(object({
    cname_from             = string
    cname_to               = string
    cert_provisioning_type = string
  }))
}

# Activation Contacts
variable "activation_contacts" {
  description = "Contacts for property activations"
  type        = list(string)
}


############# CPS DV Cert ##################
variable "sans_cps_dv" {
  type        = list(string)
  description = "SANs domain associated with the certificate"
}

############# AppSec ##################
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

variable "sec_contract_id" {
  type    = string
  default = "1-1NC95D"
}

variable "sec_group_id" {
  type    = string
  default = "19298"
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