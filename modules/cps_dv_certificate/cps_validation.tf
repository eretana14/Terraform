# 1. Automatically Create DNS TXT Records in Edge DNS
# This only creates records for SANs that Akamai identifies as needing validation.
resource "akamai_dns_record" "cps_dns_challenges" {
  for_each = {
    for d in akamai_cps_dv_enrollment.enrollment_id_302868.dns_challenges : 
    d.domain => d
  }

  # Replace with var.dns_zone if you handle multiple zones
  zone       = "eretana-cr.com"
  recordtype = "TXT"
  ttl        = 60

  # 'full_path' contains the _acme-challenge or _akamai-domain-owner prefix
  name   = each.value.full_path
  target = [each.value.response_body]
}

# 2. Buffer to allow Edge DNS to propagate globally
# This prevents CPS from checking the record before it exists everywhere.
resource "time_sleep" "wait_for_cps_dns" {
  depends_on = [akamai_dns_record.cps_dns_challenges]
  
  # 60 seconds is the sweet spot for Edge DNS propagation
  create_duration = "360s"
}

# 3. Trigger CPS Validation
# Once the sleep is over, this resource tells Akamai to verify the tokens.
resource "akamai_cps_dv_validation" "cps_validation" {
  enrollment_id = akamai_cps_dv_enrollment.enrollment_id_302868.id
  sans          = akamai_cps_dv_enrollment.enrollment_id_302868.sans
  
  # This dependency ensures the records are live and propagated first
  depends_on = [time_sleep.wait_for_cps_dns]
}