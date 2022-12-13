Function Get-GenshinDaily {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [Int]$UserId,
        [Parameter(Mandatory=$true, Position=1)]
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
        Default { Write-Error "Unknown error: $($json.retcode) $($json.message)" }
    }
    <#
    .SYNOPSIS
    Get Genshin Daily Reward from HoyoLab
    .DESCRIPTION
    Get Genshin Daily Reward from HoyoLab. This function will return a message from the response.
    .PARAMETER UserId
    User ID from HoyoLab. You can grab this from your browser's cookie in Hoyolab: `ltuid`
    .PARAMETER Token
    Token from HoyoLab. You can grab this from your browser's cookie in Hoyolab: `ltoken`
    .EXAMPLE
    Get-GenshinDaily -UserId 123456789 -Token 123456789
    .EXAMPLE
    ggd -UserId 123456789 -Token 123456789
    .EXAMPLE
    daily -UserId 123456789 -Token 123456789
    .LINK
    https://github.com/nattadasu/GetGenshinDaily
    #>
}

Set-Alias -Name ggd -Value Get-GenshinDaily
Set-Alias -Name daily -Value Get-GenshinDaily

# Export func and aliases
Export-ModuleMember -Function Get-GenshinDaily -Alias ggd, daily