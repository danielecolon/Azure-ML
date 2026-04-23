param (
    [string]$randomString
)

if (-not $randomString) {
    Write-Host "Enter the random number of Azure Resource Group name (e.g., rg-azureml-xxxx enter xxxx)" -ForegroundColor Yellow
    $randomString = Read-Host "randomString"
}

$Project = "azureml-$randomString"
$dateCreated = (Get-Date).ToString("yyyyMMdd")
$Tags = @(
    "env=demo"
    "dateCreated=$dateCreated"
)
$ResourceGroup = "rg-$Project"
$LOCATION = "eastus"

az databricks workspace create `
  --name adb-demo$randomString `
  --resource-group $ResourceGroup `
  --location $LOCATION `
  --sku trial `
  --tags $TAGS