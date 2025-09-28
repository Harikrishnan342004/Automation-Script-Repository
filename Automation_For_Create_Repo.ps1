# Read the token from file
$Token = Get-Content "C:\Users\HARI KRISHNAN\Desktop\Shell Scripts\Token.txt" -Raw

# Ask user for the new repo name
$repoName = Read-Host "Enter the name of the Github Repository"

# Ask if repo should be private
$privateInput = Read-Host "Should this repo be private? (yes/no)"
$private = if ($privateInput -eq "yes") { $true } else { $false }

# Build JSON payload
$payload = @{
    name    = $repoName
    private = $private
} | ConvertTo-Json

# GitHub API URL
$uri = "https://api.github.com/user/repos"

# Call GitHub API to create the repository
$response = Invoke-RestMethod -Method Post -Uri $uri -Headers @{
    Authorization = "token $Token"
    Accept        = "application/vnd.github.v3+json"
} -Body $payload -ContentType "application/json"

# Show response
$response


# #Read the token form file

# $Token = Get-Content "C:\Users\HARI KRISHNAN\Desktop\Shell Scripts\Token.txt" -Raw

# # Ask user for the new repo name
# $repoName = Read-Host "Enter the name of the Github Repository"

# # Ask if repo Should be private
# $privateInput = Read-Host "Should this repo br private? (yes/no)"
# $private = if ($privateInput -eq "yes") {$true } else {$false }


# $payload = @{ "name" = $repoName; "private" = $privateInput} | ConvertTo-Json

# #call GitHub API to create the repositor
# curl -u "Hari:$Token" \ 
#      https://api.github.com/user/repos \
#      -d '{"name":"Automation-Script-Repository","private":$private}'
