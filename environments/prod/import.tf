import {
  to = module.akamai_property.akamai_edge_hostname.edge_hostnames["prod-eretana-cr-com-edgekey-net"]
  id = "ehn_6190839,ctr_1-1NC95D,grp_19298"
}

import {
  to = module.akamai_property.akamai_property.eretana-terraform
  id = "prp_1344654,ctr_1-1NC95D,grp_19298,LATEST"
}

import {
  to = module.akamai_property.akamai_property_activation.eretana-terraform-staging
  id = "prp_1344654:STAGING"
}

import {
  to = module.akamai_cps_dv_certificate.akamai_cps_dv_enrollment.enrollment_id_302868
  id = "302868,ctr_1-1NC95D"
}

# # Import for the production record
# import {
#   to = module.akamai_cps_dv_certificate.akamai_dns_record.cps_dns_challenges["prod.eretana-cr.com"]
#   id = "eretana-cr.com,_akamai-domain-owner.prod.eretana-cr.com,TXT"
# }

# # Import for the QA record
# import {
#   to = module.akamai_cps_dv_certificate.akamai_dns_record.cps_dns_challenges["qa.eretana-cr.com"]
#   id = "eretana-cr.com,_akamai-domain-owner.qa.eretana-cr.com,TXT"
# }

# # Import for the apex/root record
# import {
#   to = module.akamai_cps_dv_certificate.akamai_dns_record.cps_dns_challenges["eretana-cr.com"]
#   id = "eretana-cr.com,_akamai-domain-owner.eretana-cr.com,TXT"
# }