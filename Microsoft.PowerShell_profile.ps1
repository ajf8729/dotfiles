function dismclean {
    Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
}

function gita {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$File
    )
    git add $File
}

function gitc {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Message
    )
    git commit -m $Message
}

function gitf {
    git fetch
}

function gitpl {
    git pull
}

function gitpu {
    git push
}

function gits {
    git status
}

function skynet {
    ssh ajf@anthonyfontanez.com
}

function Optimize-OfflineVHDs {
    Get-VM | Where-Object {$_.State -eq 'Off'} | Get-VMHardDiskDrive | ForEach-Object {Optimize-VHD -Path $_.Path -Mode Quick -Verbose}
}

function Update-Profile {
    Invoke-WebRequest -UseBasicParsing -Uri https://raw.githubusercontent.com/ajf8729/dotfiles/main/Microsoft.PowerShell_profile.ps1 -OutFile $PROFILE
    .$PROFILE
}

switch ($env:COMPUTERNAME) {
    'ED-209' {Set-Location -Path 'D:\AJF8729\Git'}
    default {Set-Location -Path 'C:\Users\ajf\Git'}
}

if ($PSVersionTable.PSVersion -ge '7.2.0') {
    Set-PSReadLineOption -PredictionSource History
}

Clear-Host
Get-ChildItem -Path *\*
