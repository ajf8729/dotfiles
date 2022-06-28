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

function rdns {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Data
    )
    Resolve-DnsName $Data
}

function skynet {
    ssh ajf@anthonyfontanez.com
}

function pki {
    ssh ajf@pki.ajf8729.com
}

function wiki {
    ssh ajf@wiki.winadmins.io
}

function Optimize-OfflineVHDs {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True)]
        [ValidateSet(
            'Quick',
            'Full'
        )]
        [string]$Mode
    )
    Get-VM | Where-Object {$_.State -eq 'Off'} | Get-VMHardDiskDrive | ForEach-Object {Optimize-VHD -Path $_.Path -Mode $Mode -Verbose:($PSBoundParameters['Verbose'] -eq $true)}
}

function Update-Profile {
    Invoke-WebRequest -UseBasicParsing -Uri http://bit.ly/ajf8729ps -OutFile $PROFILE
    .$PROFILE
}

switch ($env:COMPUTERNAME) {
    'AJF8729' {Set-Location -Path 'D:\AJF8729\Git'}
    default {Set-Location -Path 'C:\Users\ajf\Git'}
}

Clear-Host
Get-ChildItem -Path *\*
