module "domain_ownership_manager" {
  source = "../../modules/domain_validation"

  property_hostnames = var.property_hostnames

}
resource "time_sleep" "wait_for_papi_sync" {
  depends_on      = [module.domain_ownership_manager]
  create_duration = "90s" # Give the API 90 seconds to sync the 'Validated' status
}

module "akamai_property" {
  source                     = "../../modules/property"
  activate_latest_on_staging = var.activate_latest_on_staging
  #activate_latest_on_production  = var.activate_latest_on_production
  default_origin_hostname      = var.default_origin_hostname
  traffic_reporting_cp_code_id = var.traffic_reporting_cp_code_id
  edge_hostnames               = var.edge_hostnames
  property_config              = var.property_config
  version_notes                = var.version_notes
  property_hostnames           = var.property_hostnames
  activation_contacts          = var.activation_contacts
}

module "akamai_cps_dv_certificate" {
  source = "../../modules/cps_dv_certificate"

  sans_cps_dv = var.sans_cps_dv
  contract_id = var.contract_id
}

module "appsec" {
  source                     = "../../modules/appsec"
  sec_hostnames              = var.sec_hostnames
  sec_activation_contacts    = var.sec_activation_contacts
  sec_activation_notes       = var.sec_activation_notes
  bot_transparent_detections = var.bot_transparent_detections
  akamai_bot_categories      = var.akamai_bot_categories
  waf_attack_groups          = var.waf_attack_groups
}


