#
# Description: List all the policies that both apply to the PSC application and are active, and 
# optionnaly export them as a JSON output to a file
# Param Chemin: The export filepath
Param (
    [string][Parameter(Mandatory=$true)]$Nom,
    [string]$Chemin
)

# Get the PSC application name
if (-not $Nom) {
    Write-Output 'Le paramètre Nom est obligatoire' 
    exit
}

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "Application.Read.All,Policy.Read.All"

# Get the service principal for the PSC application
$servicePrincipal = Get-MgServicePrincipal -Filter "DisplayName eq '$Nom'"

# Get the application ID
$appId = $servicePrincipal.appId

# Get all conditional access policies
$policies = Get-MgIdentityConditionalAccessPolicy

# Filter policies that apply to the specified application and are active
$appPolicies = $policies | Where-Object {
    $_.Conditions.Applications.IncludeApplications -contains $appId -and $_.State -eq "enabled"
}

# Create an array to store policy details
$policyDetails = @()

# Loop through each policy and extract details
foreach ($policy in $appPolicies) {
    $details = [PSCustomObject]@{
        PolicyName = $policy.DisplayName
        State = $policy.State
        CreatedDateTime = $policy.CreatedDateTime
        ModifiedDateTime = $policy.ModifiedDateTime
        Description = $policy.Description
        Conditions = $policy.Conditions
        GrantControls = $policy.GrantControls
        SessionControls = $policy.SessionControls
    }
    $policyDetails += $details
}

# Display the policy details in a table format
$policyDetails | Format-Table -AutoSize

# Retrieve the output file path
if (-not $Chemin) {
    exit
}
$outputFilePath = $Chemin

# Convert the policy details to JSON
$jsonOutput = $policyDetails | ConvertTo-Json -Depth 3

# Export the JSON output to a file
$jsonOutput | Out-File -FilePath $outputFilePath -Encoding utf8

# Display a message indicating the export is complete
Write-Output "Le détails des stratégies d'accès conditionnel a été exporté vers $outputFilePath"
