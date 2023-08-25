
# Create the vanta-scanner project that will host the new service account and enable the APIs
resource "google_project" "vanta_scanner" {
  name = "vanta-scanner"
  # Change the id below if it already exists
  project_id = "vanta-scanner-${var.organization}"
  org_id     = var.organization
}
data "google_project" "vanta_scanner" {
  project_id = google_project.vanta_scanner.project_id
}

resource "google_project_service" "enabled_api" {
  for_each = toset(var.enabled_service_apis)
  service  = each.key
  project  = data.google_project.vanta_scanner.project_id

  disable_dependent_services = false # (Optional) If true, services that are enabled and which depend on this service will also be disabled. Defaults to false.
  disable_on_destroy         = false # (Optional) If true, disable the service when the Terraform resource is destroyed. Defaults to true. May be useful in the event that a project is long-lived but the infrastructure running in that project changes frequently.
}

# Create service account in the vanta-scanner project
resource "google_service_account" "vanta_scanner_service_account" {
  account_id   = "vanta-scanner-service-account"
  display_name = "vanta-scanner-service-account"
  project      = data.google_project.vanta_scanner.project_id
}

# Grant VantaProjectScanner role to the service account for each project
resource "google_project_iam_member" "vanta_project_memberships" {
  for_each = toset(var.projects)

  project = each.key
  role    = "organizations/${google_project.vanta_scanner.org_id}/roles/VantaProjectScanner"
  member  = "serviceAccount:${google_service_account.vanta_scanner_service_account.email}"
}

# Grant iam.securityReviewer role to the service account for each project
resource "google_project_iam_member" "vanta_scanner_iam_security_reviewer" {
  project = data.google_project.vanta_scanner.project_id
  role    = "roles/iam.securityReviewer"
  member  = "serviceAccount:${google_service_account.vanta_scanner_service_account.email}"
}

resource "google_project_iam_member" "iam_security_reviewer" {
  for_each = toset(var.projects)

  project = each.key
  role    = "roles/iam.securityReviewer"
  member  = "serviceAccount:${google_service_account.vanta_scanner_service_account.email}"
}
