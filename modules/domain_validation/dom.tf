# 1. Register the domains for validation
resource "akamai_property_domainownership_domains" "dom_validation" {
  domains = [
    for k, v in var.property_hostnames : {
      domain_name      = v.cname_from
      validation_scope = "HOST"
    }
  ]
}

# 2. Automatically Create Validation Records in Edge DNS
resource "akamai_dns_record" "dom_records" {
  for_each = var.property_hostnames

  zone       = "eretana-cr.com"
  recordtype = "TXT"
  ttl        = 60

  # We use try() to handle cases where a domain might already be validated 
  # and doesn't return a challenge block.
  name = try(element([
    for d in akamai_property_domainownership_domains.dom_validation.domains :
    d.validation_challenge.txt_record.name
    if d.domain_name == each.value.cname_from
  ], 0), "validated.${each.value.cname_from}")

  target = [try(element([
    for d in akamai_property_domainownership_domains.dom_validation.domains :
    d.validation_challenge.txt_record.value
    if d.domain_name == each.value.cname_from
  ], 0), "already-validated")]
}

# 3. Force Immediate Validation
resource "akamai_property_domainownership_validation" "validate" {
  depends_on = [akamai_dns_record.dom_records]

  domains = [
    for d in akamai_property_domainownership_domains.dom_validation.domains : {
      domain_name      = d.domain_name
      validation_scope = "HOST"
      # This was the missing piece causing your latest error:
      validation_method = "DNS_TXT"
    }
  ]
}

resource "time_sleep" "wait_for_papi_sync" {
  # It waits for the validation resource to finish its 12-minute polling
  depends_on = [akamai_property_domainownership_validation.validate]

  # 60 to 120 seconds is usually enough for the internal Akamai APIs to sync
  create_duration = "60s"
}