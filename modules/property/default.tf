data "akamai_property_rules_builder" "eretana-terraform_rule_default" {
  rules_v2025_10_16 {
    name      = "default"
    is_secure = true
    comments  = "The Default Rule template contains all the necessary and recommended behaviors. Rules are evaluated from top to bottom and the last matching rule wins."
    behavior {
      origin {
        cache_key_hostname            = "REQUEST_HOST_HEADER"
        compress                      = true
        enable_true_client_ip         = true
        forward_host_header           = "ORIGIN_HOSTNAME"
        hostname                      = var.default_origin_hostname
        http2_enabled                 = false
        http2_title                   = ""
        http_port                     = 80
        https_port                    = 443
        ip_version                    = "IPV4"
        min_tls_version               = "DYNAMIC"
        origin_certificate            = ""
        origin_sni                    = true
        origin_type                   = "CUSTOMER"
        ports                         = ""
        tls_version_title             = ""
        true_client_ip_client_setting = false
        true_client_ip_header         = "True-Client-IP"
        verification_mode             = "PLATFORM_SETTINGS"
      }
    }
    behavior {
      global_request_number {
        header_name   = "Akamai-GRN"
        output_option = "RESPONSE_HEADER"
      }
    }
    children = [
      data.akamai_property_rules_builder.eretana-terraform_rule_augment_insights.json,
      data.akamai_property_rules_builder.eretana-terraform_rule_accelerate_delivery.json,
      data.akamai_property_rules_builder.eretana-terraform_rule_offload_origin.json,
      data.akamai_property_rules_builder.eretana-terraform_rule_strengthen_security.json,
      data.akamai_property_rules_builder.eretana-terraform_rule_increase_availability.json,
      data.akamai_property_rules_builder.eretana-terraform_rule_minimize_payload.json,
      data.akamai_property_rules_builder.eretana-terraform_rule_redirects.json,
    ]
  }
}