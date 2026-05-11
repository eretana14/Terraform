data "akamai_property_rules_builder" "eretana-terraform_rule_redirects" {
  rules_v2025_10_16 {
    name                  = "Redirects"
    criteria_must_satisfy = "all"
    children = [
      data.akamai_property_rules_builder.eretana-terraform_rule_http.json,
    ]
  }
}

data "akamai_property_rules_builder" "eretana-terraform_rule_http" {
  rules_v2025_10_16 {
    name                  = "HTTP"
    criteria_must_satisfy = "all"
    criterion {
      request_protocol {
        value = "HTTP"
      }
    }
    behavior {
      redirect {
        destination_hostname  = "SAME_AS_REQUEST"
        destination_path      = "SAME_AS_REQUEST"
        destination_protocol  = "HTTPS"
        mobile_default_choice = "DEFAULT"
        query_string          = "APPEND"
        response_code         = 301
      }
    }
  }
}