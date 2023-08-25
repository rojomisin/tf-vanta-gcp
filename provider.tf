locals {
  # The name of the GCP project to deploy to, hold the state bucket etc
  project = "<your-host-project>"
}

provider "google" {
  project = local.project
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.78.0"
    }
  }

  required_version = ">= 1.0"

  backend "gcs" {
    bucket = "<your-host-projects-bucket>"
    prefix = "vanta/gcp"
  }
}
