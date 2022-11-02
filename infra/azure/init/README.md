# Initializing an Azure storage container for Terraform

Before using these Terraform scripts, make sure you set
these variables in order to configure the Azure provider
(so that credentials are never stored inside Terraform):

```shell
export ARM_CLIENT_ID=<client id>
export ARM_CLIENT_SECRET=<client secret>
export ARM_SUBSCRIPTION_ID=$(az account show | jq -r .id)
export ARM_TENANT_ID=$(az account show | jq -r .tenantId)
```
