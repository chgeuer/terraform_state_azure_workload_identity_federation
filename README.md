# Have Terraform (running in a GitHub action) to use managed identity to store TF state

This works, but not the way I want. The GitHub action signs-in via workload identity federation into Entra ID (a.k.a. Azure AD). Then it fetches the storage account keys from the storage account, to store Terraform state there. 

In an ideal world, it would use the EntraID/AAD user-assigned managed identity.
