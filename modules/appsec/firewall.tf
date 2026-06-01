// IP/GEO/ASN Firewall
resource "akamai_appsec_ip_geo" "prod" {
  config_id                  = akamai_appsec_configuration.security_configuration.config_id
  security_policy_id         = akamai_appsec_security_policy.security-policy.security_policy_id
  mode                       = "block"
  ukraine_geo_control_action = "deny"
}
