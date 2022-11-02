# TAP in a single AKS cluster with full profile

**These Terraform scripts are intended to be used as a Terraform module.**

Before using these Terraform scripts with Azure, make sure you run the following commands:

```shell
az login
az extension add --name aks-preview
az feature register --name PodSecurityPolicyPreview --namespace Microsoft.ContainerService
az feature list -o table --query "[?contains(name, 'Microsoft.ContainerService/PodSecurityPolicyPreview')].{Name:name,State:properties.state}"
az provider register --namespace Microsoft.ContainerService
```

Set these variables in order to configure the Azure provider
(so that credentials are never stored inside Terraform):

```shell
export ARM_SUBSCRIPTION_ID=$(az account show | jq -r .id)
export ARM_TENANT_ID=$(az account show | jq -r .tenantId)
```

You need an Azure storage container to use these Terraform scripts.
Create a storage container using the Terraform scripts defined in `azure/init`
(follow instructions).

Run this command to initialize Terraform state:

```shell
terraform init --backend-config=storage_account_name=<storage account> --backend-config=resource_group_name=<res group>
```

After running these Terraform scripts, connect to clusters using this command:

```shell
az aks get-credentials --resource-group <resource group> --name <cluster name>
```
