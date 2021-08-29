function skynet {
    ssh ajf@anthonyfontanez.com
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

C:\Windows\System32\OpenSSH\ssh-add.exe C:\Users\ajf\.ssh\id_rsa

Set-Location -Path C:\Users\ajf\Git\

Clear-Host
