param (
    [string]$randomString,
    [string]$SubscriptionId,
)

if (-not $randomString) {
    Write-Host "Enter the random number of Azure Resource Group name (e.g., rg-azureml-xxxx enter xxxx)" -ForegroundColor Yellow
    $randomString = Read-Host "randomString"
}

$ResourceGroup = "rg-azureml-$randomString"
$Workspace = "ws-azureml-$randomString"

az account set --subscription $SubscriptionId
az configure --defaults group=$ResourceGroup workspace=$Workspace

Write-Host "Creating environment..."
az ml environment create --file environment.yml

Write-Host "Submitting first job..."
az ml job create --file hello-job.yml --stream

Write-Host "Submitting second job to show cached environment reuse..."
az ml job create --file hello-job.yml --stream

Write-Host "Listing environments..."
az ml environment list -o table