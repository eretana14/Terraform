locals {
  # These are the UUIDs/Slugs 
  bot_map = {
    # Transparent Detections (Slugs)
    "Impersonators of Known Bots"           = "fda1ffb9-ef46-4570-929c-7449c0c750f8"
    "Development Frameworks"                = "da005ad3-8bbb-43c8-a783-d97d1fb71ad2"
    "HTTP Libraries"                        = "578dad32-024b-48b4-930c-db81831686f4"
    "Web Services Libraries"                 = "872ed6c2-514c-4055-9c44-9782b1c783bf"
    "Open Source Crawlers/Scraping Platforms" = "601192ae-f5e2-4a29-8f75-a0bcd3584c2b"
    "Headless Browsers/Automation Tools"    = "b88cba13-4d11-46fe-a7e0-b47e78892dc4"
    "Declared Bots (Keyword Match)"         = "074df68e-fb28-432a-ac6d-7cfb958425f1"
    "Aggressive Web Crawlers"               = "5bc041ad-c840-4202-9c2e-d7fc873dbeaf"
    "Browser Impersonator"                  = "a3b92f75-fa5d-436e-b066-426fc2919968"

    # Akamai Bot Categories (UUIDs)
    "Academic or Research Bots"             = "0c508e1d-73a4-4366-9e48-3c4a080f1c5d"
    "Artificial Intelligence (AI) Bots"     = "352fca87-71ee-4b8d-ae15-d36772556072"
    "Business Intelligence Bots"            = "8a70d29c-a491-4583-9768-7deea2f379c1"
    "E-Commerce Search Engine Bots"         = "47bcfb70-f3f5-458b-8f7c-1773b14bc6a4"
    "Enterprise Data Aggregator Bots"       = "50395ad2-2673-41a4-b317-9b70742fd40f"
    "Financial Account Aggregator Bots"     = "c6692e03-d3a8-49b0-9566-5003eeaddbc1"
    "Financial Services Bots"               = "53598904-21f5-46b1-8b51-1b991beef73b"
    "Job Search Engine Bots"                = "2f169206-f32c-48f7-b281-d534cf1ceeb3"
    "Media or Entertainment Search Bots"    = "dff258d5-b1ad-4bbb-b1d1-cf8e700e5bba"
    "News Aggregator Bots"                  = "ade03247-6519-4591-8458-9b7347004b63"
    "Online Advertising Bots"               = "36b27e0c-76fc-44a4-b913-c598c5af8bba"
    "RSS Feed Reader Bots"                  = "b58c9929-9fd0-45f7-86f4-1d6259285c3c"
    "SEO, Analytics or Marketing Bots"      = "f7558c03-9033-46ce-bbda-10eeda62a5d4"
    "Site Monitoring and Web Development Bots" = "07782c03-8d21-4491-9078-b83514e6508f"
    "Social Media or Blog Bots"             = "7035af8d-148c-429a-89da-de41e68c72d8"
    "Web Archiver Bots"                     = "831ef84a-c2bb-4b0d-b90d-bcd16793b830"
    "Web Search Engine Bots"                = "4e14219f-6568-4c9d-9bd8-b29ca2afc422"
  }
}

# --- RESOURCES ---

resource "akamai_appsec_api_constraints_protection" "bot_protection" {
  config_id          = akamai_appsec_configuration.security_configuration.config_id
  security_policy_id = akamai_appsec_security_policy.security-policy.security_policy_id
  enabled            = true
}

# Handles the Transparent Detections
resource "akamai_botman_bot_detection_action" "transparent_detections" {
  for_each = var.bot_transparent_detections

  config_id          = akamai_appsec_configuration.security_configuration.config_id
  security_policy_id = akamai_appsec_security_policy.security-policy.security_policy_id
  detection_id       = local.bot_map[each.key]

  bot_detection_action = jsonencode({ action = each.value.action })
}

# Handles the Akamai Bot Categories
resource "akamai_botman_akamai_bot_category_action" "bot_actions" {
  for_each = var.akamai_bot_categories

  config_id          = akamai_appsec_configuration.security_configuration.config_id
  security_policy_id = akamai_appsec_security_policy.security-policy.security_policy_id
  category_id        = local.bot_map[each.key]
  
  akamai_bot_category_action = jsonencode({ action = each.value.action })
}