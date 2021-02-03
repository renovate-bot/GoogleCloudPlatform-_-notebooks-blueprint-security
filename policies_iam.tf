/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

# Organizational Policies (applied at the folder level)
#
# These are the minimum policies
# - No default SA: constraints/iam.disableServiceAccountCreation
# - No SA Key creation: constraints/iam.disableServiceAccountKeyCreation
# - No default grants: constraints/iam.automaticIamGrantsForDefaultServiceAccounts
#
# (Optional policies)
# - No outside domains: constraints/iam.allowedPolicyMemberDomains

module "service_account_policy" {
  source      = "terraform-google-modules/org-policy/google"
  version     = "~> 4.0"
  policy_for  = "folder"
  folder_id   = local.folder_trusted
  constraint  = "iam.disableServiceAccountCreation"
  policy_type = "boolean"
  enforce     = true

  depends_on = [google_service_account.sa_p_notebook_compute]
}

module "service_account_key_policy" {
  source      = "terraform-google-modules/org-policy/google"
  version     = "~> 4.0"
  policy_for  = "folder"
  folder_id   = local.folder_trusted
  constraint  = "iam.disableServiceAccountKeyCreation"
  policy_type = "boolean"
  enforce     = true
}

module "iam_grant_policy" {
  source      = "terraform-google-modules/org-policy/google"
  version     = "~> 4.0"
  policy_for  = "folder"
  folder_id   = local.folder_trusted
  constraint  = "iam.automaticIamGrantsForDefaultServiceAccounts"
  policy_type = "boolean"
  enforce     = true
}
