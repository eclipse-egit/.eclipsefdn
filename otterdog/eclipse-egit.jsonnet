local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-egit') {
  settings+: {
    billing_email: "webmaster@eclipse.org",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    members_can_change_project_visibility: false,
    name: "Eclipse EGit",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/egit/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('egit') {
      allow_merge_commit: true,
      default_branch: "master",
      description: "EGit, the git integration of Eclipse IDE",
      has_discussions: true,
      homepage: "https://www.eclipse.org/egit/",
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('egit-github') {
      allow_merge_commit: true,
      default_branch: "master",
      description: "EGit GitHub API client",
      has_discussions: true,
      homepage: "https://www.eclipse.org/egit/",
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('egit-permissions') {
      allow_merge_commit: true,
      description: "GerritHub permissions for EGit repositories",
      homepage: "https://www.eclipse.org/egit/",
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('egit-pipelines') {
      allow_merge_commit: true,
      default_branch: "master",
      description: "CI pipelines for EGit",
      has_discussions: true,
      homepage: "https://www.eclipse.org/egit/",
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('egit-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
  ],
}
