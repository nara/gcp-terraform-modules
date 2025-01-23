locals{
    #lookup which members need token creator access to these SAs
    token_creator_member = "user:nara@smartfigarage.com"
    token_creator_role = "roles/iam.serviceAccountTokenCreator"
    service_accounts = [google_service_account.auto_security_sa.id, 
        google_service_account.auto_network_sa.id,
        google_service_account.auto_db_sa.id,
        google_service_account.preglobal_app_sa.id,
        google_service_account.postglobal_app_sa.id,
        google_service_account.regional_app_sa.id,
        google_service_account.service_app_sa.id
    ]
}

resource "google_service_account_iam_member" "auto_security_sa_token" {
  for_each = { for idx, value in local.service_accounts: idx => value }
  service_account_id = each.value
  role    = local.token_creator_role
  member  = local.token_creator_member
}