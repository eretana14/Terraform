resource "akamai_cps_dv_enrollment" "enrollment_id_302868" {
  common_name                           = "eretana-cr.com"
  allow_duplicate_common_name           = false
  sans                                  = var.sans_cps_dv
  secure_network                        = "enhanced-tls"
  sni_only                              = true
  acknowledge_pre_verification_warnings = true
  admin_contact {
    first_name       = "Eddy"
    last_name        = "Retana"
    organization     = ""
    email            = "eddyretanav14@gmail.com"
    phone            = "+506 83331848"
    address_line_one = ""
    city             = ""
    region           = ""
    postal_code      = ""
    country_code     = ""
  }
  certificate_chain_type = "default"
  csr {
    country_code        = "CR"
    city                = "San Jose"
    organization        = "Akamai Technologies "
    organizational_unit = ""
    state               = "Escazu"
  }
  network_configuration {
    disallowed_tls_versions = ["TLSv1", "TLSv1_1", ]
    clone_dns_names         = true
    geography               = "core"
    must_have_ciphers       = "ak-akamai-2020q1"
    ocsp_stapling           = "on"
    preferred_ciphers       = "ak-akamai-2020q1"
  }
  signature_algorithm = "SHA-256"
  tech_contact {
    first_name       = "Eddy"
    last_name        = "Retana"
    organization     = ""
    email            = "eretana@akamai.com"
    phone            = "+506 83331848"
    address_line_one = ""
    city             = ""
    region           = ""
    postal_code      = ""
    country_code     = ""
  }
  organization {
    name             = "Akamai Technologies "
    phone            = "+506-41008180"
    address_line_one = "Roble Corporate Center"
    address_line_two = "Floor 7"
    city             = "San Jose"
    region           = "Escazu"
    postal_code      = "10201"
    country_code     = "CR"
  }
  contract_id = var.contract_id
}