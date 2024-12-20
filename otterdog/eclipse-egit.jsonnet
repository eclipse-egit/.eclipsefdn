local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-egit') {
  settings+: {
    description: "",
    name: "Eclipse EGit",
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
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('*') {
          allows_force_pushes: true,
          push_restrictions+: [
            "@eclipse-egit-bot"
          ],
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
          restricts_pushes: true,
        },
      ],
    },
    orgs.newRepo('egit-github') {
      allow_merge_commit: true,
      default_branch: "master",
      description: "EGit GitHub API client",
      has_discussions: true,
      homepage: "https://www.eclipse.org/egit/",
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('*') {
          allows_force_pushes: true,
          push_restrictions+: [
            "@eclipse-egit-bot"
          ],
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
          restricts_pushes: true,
        },
      ],
    },
    orgs.newRepo('egit-permissions') {
      allow_merge_commit: true,
      description: "GerritHub permissions for EGit repositories",
      homepage: "https://www.eclipse.org/egit/",
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('*') {
          allows_force_pushes: true,
          push_restrictions+: [
            "@eclipse-egit-bot"
          ],
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
          restricts_pushes: true,
        },
      ],
    },
    orgs.newRepo('egit-pipelines') {
      allow_merge_commit: true,
      default_branch: "master",
      description: "CI pipelines for EGit",
      has_discussions: true,
      homepage: "https://www.eclipse.org/egit/",
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('*') {
          allows_force_pushes: true,
          push_restrictions+: [
            "@eclipse-egit-bot"
          ],
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
          restricts_pushes: true,
        },
      ],
    },
    orgs.newRepo('egit-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('*') {
          allows_force_pushes: true,
          push_restrictions+: [
            "@eclipse-egit-bot"
          ],
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
          restricts_pushes: true,
        },
      ],
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}