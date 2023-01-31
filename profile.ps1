# Azure Functions profile.ps1
#
# This profile.ps1 will get executed every "cold start" of your Function App.
# "cold start" occurs when:
#
# * A Function App starts up for the very first time
# * A Function App starts up after being de-allocated due to inactivity
#
# You can define helper functions, run commands, or specify environment variables
# NOTE: any variables defined that are not environment variables will get reset after the first execution

# Authenticate with Azure PowerShell using MSI.
# Remove this if you are not planning on using MSI or Azure PowerShell.
if ($env:MSI_SECRET) {
    Disable-AzContextAutosave -Scope Process | Out-Null

    #Connecting to Azure
    Connect-AzAccount -Identity -AccountId $env:MSI_CLIENTID
}
else {

    $applicationId = '8d8cc8ce-f093-4623-9e85-c85560f3ffe7'
    $tenantId = 'f1a7abe2-4430-4e89-9397-32b1a0cfb9dd'
    $secret = 'x6Cz4@uSzm0mWIX3IYOHZMNhuSHtJ=*:'
    $securePassword = $secret | ConvertTo-SecureString -AsPlainText -Force
    $credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $applicationId, $securePassword
    
    Connect-AzAccount -ServicePrincipal -Credential $credential -TenantId $tenantId
}

# Uncomment the next line to enable legacy AzureRm alias in Azure PowerShell.
# Enable-AzureRmAlias

# You can also define functions or aliases that can be referenced in any of your PowerShell functions.
