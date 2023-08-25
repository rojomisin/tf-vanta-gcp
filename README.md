## Requirements

Must have GCP Organization and Project Admin permissions.

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.78.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 4.78.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_organization_iam_custom_role.vanta_org_scanner_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_custom_role) | resource |
| [google_organization_iam_custom_role.vanta_project_scanner_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_custom_role) | resource |
| [google_organization_iam_member.vanta_org_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_project.vanta_scanner](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project) | resource |
| [google_project_iam_member.iam_security_reviewer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.vanta_project_memberships](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.vanta_scanner_iam_security_reviewer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.enabled_api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.vanta_scanner_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_project.vanta_scanner](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
