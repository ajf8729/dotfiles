function dismclean {
    Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
}

function e {
    exit
}

function Get-PatchTuesday {
    $Month = Get-Date -Format 'MMMM'
    switch ((Get-Date -Day 1).DayOfWeek) {
        'Tuesday'   {return "Patch Tuesday is on $Month 8th"}
        'Monday'    {return "Patch Tuesday is on $Month 9th"}
        'Sunday'    {return "Patch Tuesday is on $Month 10th"}
        'Saturday'  {return "Patch Tuesday is on $Month 11th"}
        'Friday'    {return "Patch Tuesday is on $Month 12th"}
        'Thursday'  {return "Patch Tuesday is on $Month 13th"}
        'Wednesday' {return "Patch Tuesday is on $Month 14th"}
    }
}

New-Alias -Name gpt -Value Get-PatchTuesday

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

function p {
    .$PROFILE
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

function toolbox {
    ssh ajf@toolbox.ajf.one
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

Set-PSReadLineOption -PredictionViewStyle ListView

Clear-Host

Get-VM | Where-Object -FilterScript {$_.State -eq 'Running'} | Sort-Object -Property Name
