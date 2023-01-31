param($Context)

$output = @()

$output += Invoke-DurableActivity -FunctionName 'CreateSubscription' -Input 'Tokyo'
$output += Invoke-DurableActivity -FunctionName 'AssignRoles' -Input 'Seattle'

$output
