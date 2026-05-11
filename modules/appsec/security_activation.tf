# 1. This Data Source looks up the configuration.
# Because it depends on the bot actions, it will only "read" the version 
# AFTER those bot actions are created.
data "akamai_appsec_configuration" "config_refresh" {
  name = akamai_appsec_configuration.security_configuration.name

  depends_on = [
    akamai_botman_bot_detection_action.transparent_detections,
    akamai_botman_akamai_bot_category_action.bot_actions,
    akamai_appsec_attack_group.waf_groups
  ]
}


# 2. The Activation Resource
resource "akamai_appsec_activations" "security_staging_activation" {
  config_id           = akamai_appsec_configuration.security_configuration.config_id
  
  # We use the latest_version from the data source we just refreshed
  version             = data.akamai_appsec_configuration.config_refresh.latest_version
  
  network             = "STAGING"
  note                = var.sec_activation_notes
  notification_emails = var.sec_activation_contacts

  # Safety: Ensure everything else is done before activating
  depends_on = [
    akamai_appsec_match_target.main_match_target,
    akamai_botman_bot_detection_action.transparent_detections,
    akamai_botman_akamai_bot_category_action.bot_actions,
    akamai_appsec_attack_group.waf_groups # Add this line
  ]
}




# resource "akamai_appsec_activations" "security_staging_activation" {
#   config_id           = akamai_appsec_configuration.security_configuration.config_id
#   version             = data.akamai_appsec_configuration.config_lookup.latest_version
#   network             = "STAGING"
#   note                = var.sec_activation_notes
#   notification_emails = var.sec_activation_contacts

#   depends_on = [
#     akamai_appsec_match_target.main_match_target
#   ]
# }