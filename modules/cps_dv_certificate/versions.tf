terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = ">= 10.1.0"
    }
    time = {
      source = "hashicorp/time"
    }
  }
  required_version = ">= 1.0"
}
