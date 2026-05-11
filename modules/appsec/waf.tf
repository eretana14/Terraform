# # --- WAF Mode Selection ---
# # Setting this to manual ensures your specific 'alert' or 'deny' 
# # settings are not overridden by the engine's automation.
# resource "akamai_appsec_waf_mode" "waf_mode" {
#   config_id          = akamai_appsec_configuration.security_configuration.config_id
#   security_policy_id = akamai_appsec_security_policy.security-policy.security_policy_id
#   mode               = "ASE_AUTO"
# }

# # --- 10 Attack Groups (All set to Alert) ---

# resource "akamai_appsec_attack_group" "command_injection" {
#   config_id           = akamai_appsec_configuration.security_configuration.config_id
#   security_policy_id  = akamai_appsec_security_policy.security-policy.security_policy_id
#   attack_group        = "CMD"
#   attack_group_action = "alert"
# }

# resource "akamai_appsec_attack_group" "xss" {
#   config_id           = akamai_appsec_configuration.security_configuration.config_id
#   security_policy_id  = akamai_appsec_security_policy.security-policy.security_policy_id
#   attack_group        = "XSS"
#   attack_group_action = "alert"
# }

# resource "akamai_appsec_attack_group" "lfi" {
#   config_id           = akamai_appsec_configuration.security_configuration.config_id
#   security_policy_id  = akamai_appsec_security_policy.security-policy.security_policy_id
#   attack_group        = "LFI"
#   attack_group_action = "alert"
# }

# resource "akamai_appsec_attack_group" "rfi" {
#   config_id           = akamai_appsec_configuration.security_configuration.config_id
#   security_policy_id  = akamai_appsec_security_policy.security-policy.security_policy_id
#   attack_group        = "RFI"
#   attack_group_action = "alert"
# }

# resource "akamai_appsec_attack_group" "sqli" {
#   config_id           = akamai_appsec_configuration.security_configuration.config_id
#   security_policy_id  = akamai_appsec_security_policy.security-policy.security_policy_id
#   attack_group        = "SQL"
#   attack_group_action = "alert"
# }

# resource "akamai_appsec_attack_group" "outbound" {
#   config_id           = akamai_appsec_configuration.security_configuration.config_id
#   security_policy_id  = akamai_appsec_security_policy.security-policy.security_policy_id
#   attack_group        = "OUTBOUND"
#   attack_group_action = "alert"
# }

# resource "akamai_appsec_attack_group" "web_attack_tool" {
#   config_id           = akamai_appsec_configuration.security_configuration.config_id
#   security_policy_id  = akamai_appsec_security_policy.security-policy.security_policy_id
#   attack_group        = "WAT"
#   attack_group_action = "alert"
# }

# resource "akamai_appsec_attack_group" "web_platform_attack" {
#   config_id           = akamai_appsec_configuration.security_configuration.config_id
#   security_policy_id  = akamai_appsec_security_policy.security-policy.security_policy_id
#   attack_group        = "PLATFORM"
#   attack_group_action = "alert"
# }

# resource "akamai_appsec_attack_group" "web_policy_violation" {
#   config_id           = akamai_appsec_configuration.security_configuration.config_id
#   security_policy_id  = akamai_appsec_security_policy.security-policy.security_policy_id
#   attack_group        = "POLICY"
#   attack_group_action = "alert"
# }

# resource "akamai_appsec_attack_group" "web_protocol_attack" {
#   config_id           = akamai_appsec_configuration.security_configuration.config_id
#   security_policy_id  = akamai_appsec_security_policy.security-policy.security_policy_id
#   attack_group        = "PROTOCOL"
#   attack_group_action = "alert"
# }

# --- WAF Mode Selection ---
resource "akamai_appsec_waf_mode" "waf_mode" {
  config_id          = akamai_appsec_configuration.security_configuration.config_id
  security_policy_id = akamai_appsec_security_policy.security-policy.security_policy_id
  mode               = "ASE_AUTO"
}

# --- Dynamic Attack Groups ---
resource "akamai_appsec_attack_group" "waf_groups" {
  for_each = var.waf_attack_groups

  config_id          = akamai_appsec_configuration.security_configuration.config_id
  security_policy_id = akamai_appsec_security_policy.security-policy.security_policy_id
  
  # The 'key' will be the Short Name (CMD, SQL, etc.)
  attack_group       = each.key
  
  # The 'action' will come from your tfvars
  attack_group_action = each.value.action
}