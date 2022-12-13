<!-- omit in toc -->
# Genshin Impact Daily Login Claimer

*Claim your daily login rewards for [Genshin Impact](https://genshin.hoyoverse.com/en/) from [Hoyolab](https://hoyolab.com) via PowerShell command!*

<!-- Also, this module is powered by GitHub Copilot -->

<!-- omit in toc -->
## Table of Contents

* [About](#about)
* [Warranty and Liability Notice](#warranty-and-liability-notice)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installing](#installing)
* [Parameters](#parameters)
  * [UserID](#userid)
  * [Token](#token)
* [Examples](#examples)
* [Aliases](#aliases)
* [License](#license)

## About

Get Genshin Daily Reward from HoyoLab. This function will return a message from the response.

## Warranty and Liability Notice

This module is provided as-is, without warranty of any kind. The author is not responsible for any damage or loss of data that may result from the use of this module. Use at your own risk.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine .

### Prerequisites

You must to have latest PowerShell Core installed on your system. You can download it from [here](https://github.com/PowerShell/PowerShell/releases).

Or, for Windows 10 (1809 Build 17763) or higher user can use WinGet:

```powershell
winget install --id Microsoft.PowerShell -e
```

You also need to install [`InstallModuleFromGitHub` module from PSGallery](https://www.powershellgallery.com/packages/InstallModuleFromGitHub), as this module won't be published to PSGallery *due to this mddule's nature*.

```powershell
Install-Module -Name InstallModuleFromGitHub
```

### Installing

You can install the module via `Install-ModuleFromGitHub` command (`sudo` may be required for Linux and macOS or run PowerShell as Administrator for Windows):

```powershell
Install-ModuleFromGitHub -GitHubRepo nattadasu/GetGenshinDaily
```

To instal the module without root/administrator permission, you can use `-Scope CurrentUser` parameter:

```powershell
Install-ModuleFromGitHub -GitHubRepo nattadasu/GetGenshinDaily -Scope CurrentUser
```

## Parameters

### UserID

Your HoyoLab UserID.

To grab your UserID, follow these steps:

Instruction based on Chrome Dev Tools:

<!-- Instructions from Ethiner/hoyolab_daily_login -->
1. Go to [HoYoLAB](http://hoyolab.com)
2. Log-In to your account
3. Press F12 to open Developer Tools
4. Go to Application -> Cookies -> `https://www.hoyolab.com`
5. Copy `ltuid`

### Token

Your HoyoLab Token.

To grab your Token, follow these steps:

Instruction based on Chrome Dev Tools:

<!-- Instructions from Ethiner/hoyolab_daily_login -->
1. Go to [HoYoLAB](http://hoyolab.com)
2. Log-In to your account
3. Press F12 to open Developer Tools
4. Go to Application -> Cookies -> `https://www.hoyolab.com`
5. Copy `ltoken`

## Examples

```powershell
Get-GenshinDaily -UserID 123456789 -Token 123456789
```

## Aliases

This module has aliases for `Get-GenshinDaily` command:

`ggd`, `daily`

To add aliases to your PowerShell session, modify your `$PROFILE` file:

```powershell
# Add aliases to your PowerShell session
Set-Alias -Name ggd -Value Get-GenshinDaily
#               ^^^
#               Alias name
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
