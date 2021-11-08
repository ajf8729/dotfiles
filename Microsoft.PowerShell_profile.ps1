function dismclean {
    Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
}

function gita {
    Param(
        [Parameter(Mandatory=$true)]
        [string]$File
    )

    git add $File
}

function gitc {
    Param(
        [Parameter(Mandatory=$true)]
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

function unlockwu {
    Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\ -Name UseWUServer -Value 0
    Restart-Service -Name wuauserv
}

Set-Location -Path C:\AJF8729\Git\
Set-PSReadLineOption -PredictionSource History
Clear-Host
