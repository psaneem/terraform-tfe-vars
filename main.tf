provider "tfe"{
    token = var.tfe_token
}

data "tfe_workspace" "example"{
       name = var.workspace
       organization = var.tfe_organization
   }
   resource "tfe_variable" "test"{   
       key = "AWS_ACCESS_KEY"  
       value = var.access_key
       workspace_id = data.tfe_workspace.example.id 
       category = "env"
       description = "test"

   }
   resource "tfe_variable" "test2"{   
       key = "AWS_SECRET_ACCESS_KEY"  
       value = var.secret_key
       workspace_id = data.tfe_workspace.example.id 
       category = "env"
       description = "test"
       sensitive = true

   }