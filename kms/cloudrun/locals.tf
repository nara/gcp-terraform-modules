locals {
    encrypters = [join(",", distinct(concat(var.encrypters, 
        //["serviceAccount:${module.naming_conv.cloud_run_service_account_name}@${var.serverless_project_id}.iam.gserviceaccount.com,service-${data.google_project.serverless_project_id.number}@serverless-robot-prod.iam.gserviceaccount.com"])))]
        ["serviceAccount:${module.naming_conv.cloud_run_service_account_name}@${var.serverless_project_id}.iam.gserviceaccount.com"])))]

    decrypters = [join(",", distinct(concat(var.decrypters, 
        //["serviceAccount:${module.naming_conv.cloud_run_service_account_name}@${var.serverless_project_id}.iam.gserviceaccount.com,service-${data.google_project.serverless_project_id.number}@serverless-robot-prod.iam.gserviceaccount.com"])))]
        ["serviceAccount:${module.naming_conv.cloud_run_service_account_name}@${var.serverless_project_id}.iam.gserviceaccount.com"])))]
}