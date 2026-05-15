output "dns_challenges" {
  value = akamai_cps_dv_enrollment.enrollment_id_302868.dns_challenges
}

output "cps_dns_challenges" {
  value       = akamai_cps_dv_enrollment.enrollment_id_302868.dns_challenges
  description = "List of DNS TXT records required for CPS validation"
}

output "enrollment_id" {
  value = akamai_cps_dv_enrollment.enrollment_id_302868.id
}

