variable "property_hostnames" {
  description = "Hostnames for the property"
  type = map(object({
    cname_from             = string
    cname_to               = string
    cert_provisioning_type = string
  }))
}
