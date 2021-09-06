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

Set-Location -Path C:\AJF8729\Git\
Clear-Host
