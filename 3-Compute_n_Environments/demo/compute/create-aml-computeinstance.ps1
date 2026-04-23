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
$Workspace = "ws-$Project"
$Size = "Standard_F4s_v2"

az ml compute create `
  --name ci-demo$randomString `
  --type ComputeInstance `
  --resource-group $ResourceGroup `
  --workspace-name $Workspace `
  --size $Size `
  --tags $TAGS