resource "akamai_appsec_configuration" "security_configuration" {
  name        = "eretana-security-terraform"
  description = "Security config using terraform"
  contract_id = var.sec_contract_id
  group_id    = var.sec_group_id
  host_names  = var.sec_hostnames
}

// Create new with default settings
resource "akamai_appsec_security_policy" "security-policy" {
  config_id              = akamai_appsec_configuration.security_configuration.config_id
  default_settings       = true
  security_policy_name   = "prod"
  security_policy_prefix = "1997"
}

