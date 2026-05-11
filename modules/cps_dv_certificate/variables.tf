variable "edgerc_path" {
  type    = string
  default = "~/.edgerc"
}

variable "config_section" {
  type    = string
  default = "terraform"
}

variable "sans_cps_dv" {
  type = list(string)
  description = "SAN domain associated with the certificate"
}

variable "contract_id" {
  type        = string
}