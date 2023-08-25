# Create custom roles
resource "google_organization_iam_custom_role" "vanta_project_scanner_role" {
  # Creates the VantaProjectScanner role
  org_id      = data.google_project.vanta_scanner.org_id
  role_id     = "VantaProjectScanner"
  title       = "Vanta Project Scanner"
  description = "Role for listing project resources with configuration metadata"
  permissions = [
    "resourcemanager.projects.get",
    "bigquery.datasets.get",
    "compute.instances.get",
    "compute.instances.getEffectiveFirewalls",
    "compute.subnetworks.get",
    "pubsub.topics.get",
    "storage.buckets.get",
    "appengine.applications.get",
    "cloudasset.assets.searchAllResources",
  ]
}

resource "google_organization_iam_custom_role" "vanta_org_scanner_role" {
  # Creates the VantaOrganizationScanner role
  org_id      = data.google_project.vanta_scanner.org_id
  role_id     = "VantaOrganizationScanner"
  title       = "Vanta Organization Scanner"
  description = "Role for listing inherited IAM policies"
  permissions = [
    "iam.roles.list",
    "resourcemanager.organizations.getIamPolicy",
    "resourcemanager.folders.getIamPolicy",
  ]
}

# Grant VantaOrganizationScanner role to the service account at the organization level
resource "google_organization_iam_member" "vanta_org_member" {
  member = "serviceAccount:${google_service_account.vanta_scanner_service_account.email}"
  org_id = data.google_project.vanta_scanner.org_id
  role   = "organizations/${google_project.vanta_scanner.org_id}/roles/VantaOrganizationScanner"
}