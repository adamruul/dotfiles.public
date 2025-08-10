Set-Alias -name vim -Value nvim
Set-Alias -name emptytrash -Value Empty-RecycleBin
Set-Alias -name reload -Value Reload-Powershell


function rmdir {
	Remove-Item -Recurse -Force -Path $args
}

function which($name) { Get-Command $name -ErrorAction SilentlyContinue | Select-Object Definition }
function touch($file) { "" | Out-File $file -Encoding ASCII }

# Sudo
function sudo() {
    if ($args.Length -eq 1) {
        start-process $args[0] -verb "runAs"
    }
    if ($args.Length -gt 1) {
        start-process $args[0] -ArgumentList $args[1..$args.Length] -verb "runAs"
    }
}

# Reload the Shell
function Reload-Powershell() {
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
    $newProcess.Arguments = "-nologo";
    [System.Diagnostics.Process]::Start($newProcess);
    exit
}

# Empty the Recycle Bin on all drives
function Empty-RecycleBin() {
    $RecBin = (New-Object -ComObject Shell.Application).Namespace(0xA)
    $RecBin.Items() | %{Remove-Item $_.Path -Recurse -Confirm:$false}
}

function myip {
        echo "Resolving IP..."

        # External IP
        $MyExternalIP = (Invoke-WebRequest ifconfig.me/ip).Content.Trim()

		# External IP location.
        $MyCountry = (Invoke-WebRequest ifconfig.co/country).Content.Trim()
        $MyCity = (Invoke-WebRequest ifconfig.co/city).Content.Trim()
        $MyLocationString = "$MyCountry/$MyCity"

        # Internal IP
        $MyInternalIP = (
        Get-NetIPConfiguration |
        Where-Object {
                $_.IPv4DefaultGateway -ne $null -and
                $_.NetAdapter.Status -ne "Disconnected"
        }
        ).IPv4Address.IPAddress


        $MyInternalIPFirst = "$MyInternalIP".split(" ")[0]

        # Hostname
        $MyHostname = [System.Net.Dns]::GetHostByAddress("$MyInternalIPFirst").Hostname

        echo "---------------------------------------------------------------------"
        echo "Hostname: `t$MyHostname"
        echo "Internal IP: `t$MyInternalIPFirst"
        echo "External IP: `t$MyExternalIP ($MyLocationString)"      
        echo "---------------------------------------------------------------------"
}


function la {
        ls -Force $args
}


function lsa {
        ls -Force $args
}

function lsd {
        ls -Directory -Force $args
}

function explore {
	explorer .
}

function gss {
	git status -s $args
}

function gaa {
	git add --all $args
}

function gcmsg {
	git commit -m $args
}

function gcan! {
	git commit -v -a --no-edit --amend $args
}


oh-my-posh init pwsh --config '$HOME/dotfiles.public/robbyrussell.omp.json' | Invoke-Expression
