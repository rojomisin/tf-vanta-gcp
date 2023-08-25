variable "project" {
  type = string
}

variable "organization" {
  type = string
}

variable "projects" {
  type = list(string)
}

variable "enabled_service_apis" {
  type = list(string)
  default = [
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "bigquery.googleapis.com",
    "sqladmin.googleapis.com",
    "containeranalysis.googleapis.com",
    "firestore.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "pubsub.googleapis.com",
    "storage-api.googleapis.com",
    "cloudasset.googleapis.com",
  ]
}