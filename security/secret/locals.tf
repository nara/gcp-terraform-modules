locals{
    //secret_names = try(toset(tolist(module.secret_manager.secret_names)), [])
    secret_names = [for item in var.secrets : item.name ]

    sa_secrets = {for i, item in distinct(flatten([
        for sa_type in toset(keys(module.naming_conv.automation_sa_name_map)) : [
            for item in local.secret_names : {
                sa_type = sa_type
                name    = item
            }
        ]
  ])): i => item}
}