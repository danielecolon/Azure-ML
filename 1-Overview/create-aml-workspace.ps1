## Install / Update Azure ML Extension (Only need to do this once.  No harm in doing this more than once.)
az extension add --name ml --yes
az extension update --name ml

## Register Required Providers (Only need to do this once.  No harm in doing this more than once.)
az provider register --namespace Microsoft.MachineLearningServices
az provider register --namespace Microsoft.ContainerRegistry
az provider register --namespace Microsoft.Storage
az provider register --namespace Microsoft.KeyVault

$randomString = -join ((0..9) | Get-Random -Count 4)
$Project = "azureml-$randomString"
$Location = "eastus"
$dateCreated = (Get-Date).ToString("yyyyMMdd")
$Tags = "env=demo dateCreated=$dateCreated"
$ResourceGroup = "rg-$Project"
$Workspace = "ws-$Project"

az group create --name $ResourceGroup --location $Location --tags $Tags -o none
az group show --name $ResourceGroup --query name -o tsv

az ml workspace create --name $Workspace --resource-group $ResourceGroup --location $Location -o none
az ml workspace show --name $Workspace --resource-group $ResourceGroup --query name -o tsv