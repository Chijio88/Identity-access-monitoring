param(
    [Parameter(Mandatory = $true)]
    [string]$SubscriptionId,

    [Parameter(Mandatory = $true)]
    [string]$ResourceGroupName,

    [Parameter(Mandatory = $true)]
    [string]$WorkspaceName,

    [string]$Location
)

# Resolve location if not provided
if (-not $Location) {
    $Location = (Get-AzResourceGroup -Name $ResourceGroupName).Location
}

Write-Host "Setting subscription context..." -ForegroundColor Cyan
Select-AzSubscription -SubscriptionId $SubscriptionId | Out-Null

# When the script lives in scripts/, the template is in ../solution/
$templateFile = Join-Path $PSScriptRoot "..\solution\identity-access-monitoring-solution.json"

if (!(Test-Path $templateFile)) {
    throw "Template not found: $templateFile"
}

Write-Host "Deploying Identity & Access Monitoring solution to RG '$ResourceGroupName' and workspace '$WorkspaceName'..." -ForegroundColor Cyan

New-AzResourceGroupDeployment `
    -Name "IdentityAccessMonitoring-$(Get-Date -Format 'yyyyMMddHHmmss')" `
    -ResourceGroupName $ResourceGroupName `
    -TemplateFile $templateFile `
    -workspaceName $WorkspaceName `
    -location $Location `
    -Verbose

Write-Host "Deployment completed." -ForegroundColor Green
