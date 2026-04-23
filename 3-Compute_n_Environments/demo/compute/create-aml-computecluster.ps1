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
  --name cluster-demo$randomString `
  --type amlcompute `
  --resource-group $ResourceGroup `
  --workspace-name $Workspace `
  --size $Size `
  --min-instances 0 `
  --max-instances 2 `
  --tags $TAGS