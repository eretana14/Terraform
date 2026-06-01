
activate_latest_on_staging = true
#activate_latest_on_production = true

default_origin_hostname      = "origin.mpulse-akaed.com"
traffic_reporting_cp_code_id = 2000293

# Edge Hostnames
edge_hostnames = {
  "prod-eretana-cr-com-edgekey-net" = {
    ip_behavior   = "IPV6_COMPLIANCE"
    edge_hostname = "prod.eretana-cr.com.edgekey.net"
    certificate   = 302868
  },
}

# Property Configuration
property_config = {
  name       = "eretana-terraform"
  product_id = "prd_Fresca"
}


# Property Hostnames
property_hostnames = {
  "hostname_1" = {
    cname_from             = "prod.eretana-cr.com"
    cname_to               = "prod.eretana-cr.com.edgekey.net"
    cert_provisioning_type = "CPS_MANAGED"
  },
  "hostname_2" = {
    cname_from             = "eretana-cr.com"
    cname_to               = "prod.eretana-cr.com.edgekey.net"
    cert_provisioning_type = "CPS_MANAGED"
  },
  "hostname_3" = {
    cname_from             = "www.eretana-cr.com"
    cname_to               = "prod.eretana-cr.com.edgekey.net"
    cert_provisioning_type = "CPS_MANAGED"
  },

}

# Activation Contacts
activation_contacts = [
  "eretana@akamai.com",
]

version_notes = "onboarding new domain www.eretana-cr.com"


############# CPS DV Certificate - SAN domains ################
sans_cps_dv = [
  "prod.eretana-cr.com",
  "qa.eretana-cr.com",
  "www.eretana-cr.com",
]

############# AppSec ################
sec_hostnames = [
  "prod.eretana-cr.com",
  "eretana-cr.com"
]

sec_activation_contacts = [
  "eretana@akamai.com"
]

sec_activation_notes = "bot transparent detections set to deny"

bot_transparent_detections = {
  "Impersonators of Known Bots"             = { action = "deny" }
  "Development Frameworks"                  = { action = "deny" }
  "HTTP Libraries"                          = { action = "deny" }
  "Web Services Libraries"                  = { action = "deny" }
  "Open Source Crawlers/Scraping Platforms" = { action = "deny" }
  "Headless Browsers/Automation Tools"      = { action = "deny" }
  "Declared Bots (Keyword Match)"           = { action = "deny" }
  "Aggressive Web Crawlers"                 = { action = "deny" }
  "Browser Impersonator"                    = { action = "deny" }
}

akamai_bot_categories = {
  "Academic or Research Bots"                = { action = "monitor" }
  "Artificial Intelligence (AI) Bots"        = { action = "monitor" }
  "Business Intelligence Bots"               = { action = "monitor" }
  "E-Commerce Search Engine Bots"            = { action = "monitor" }
  "Enterprise Data Aggregator Bots"          = { action = "monitor" }
  "Financial Account Aggregator Bots"        = { action = "monitor" }
  "Financial Services Bots"                  = { action = "monitor" }
  "Job Search Engine Bots"                   = { action = "monitor" }
  "Media or Entertainment Search Bots"       = { action = "monitor" }
  "News Aggregator Bots"                     = { action = "monitor" }
  "Online Advertising Bots"                  = { action = "monitor" }
  "RSS Feed Reader Bots"                     = { action = "monitor" }
  "SEO, Analytics or Marketing Bots"         = { action = "monitor" }
  "Site Monitoring and Web Development Bots" = { action = "monitor" }
  "Social Media or Blog Bots"                = { action = "monitor" }
  "Web Archiver Bots"                        = { action = "monitor" }
  "Web Search Engine Bots"                   = { action = "monitor" }
}

waf_attack_groups = {
  "CMD"      = { action = "alert" }
  "XSS"      = { action = "alert" }
  "LFI"      = { action = "alert" }
  "RFI"      = { action = "alert" }
  "SQL"      = { action = "alert" }
  "OUTBOUND" = { action = "alert" }
  "WAT"      = { action = "alert" }
  "PLATFORM" = { action = "alert" }
  "POLICY"   = { action = "alert" }
  "PROTOCOL" = { action = "alert" }
}