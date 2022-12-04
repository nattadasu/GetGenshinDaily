Function Get-GenshinDaily {
    [CmdletBinding()]
    param (
        [Int]$UserId,
        [String]$Token
    )
    $Url = "https://hk4e-api-os.mihoyo.com/event/sol/sign?act_id=e202102251931481"
    $Iwr = Invoke-WebRequest -Uri $Url -Method Post -Headers @{ Cookie = "ltuid=$UserId; ltoken=$Token" }
    # Get response
    $json = $Iwr.Content | ConvertFrom-Json
    # Export message from $json.message
    Switch ($json.retcode) {
        "0" { Write-Output $json.data.message }
        "-100" { Write-Error "Token expired, not logged in, or auth error" }
        "-5003" { Write-Error "You have already signed in today" }
        "-10001" { Write-Error "Invalid request" }
        Default { Write-Error "Unknown error" }
    }
}

Set-Alias -Name ggd -Value Get-GenshinDaily
Set-Alias -Name daily -Value Get-GenshinDaily

# Export func and aliases
Export-ModuleMember -Function Get-GenshinDaily -Alias ggd, daily