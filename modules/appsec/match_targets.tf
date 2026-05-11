resource "akamai_appsec_match_target" "main_match_target" {
  config_id = akamai_appsec_configuration.security_configuration.config_id
  
  match_target = jsonencode({
    type            = "website"
    hostnames       = var.sec_hostnames
    filePaths       = ["/*"] 
    # Add these three lines to match the API's generated state:
    targetId            = 12523392
    defaultFile         = "NO_MATCH"
    isNegativePathMatch = false

    securityPolicy  = {
      policyId = akamai_appsec_security_policy.security-policy.security_policy_id
    }
  })
}