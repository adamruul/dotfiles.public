Set-Alias -name vim -Value nvim

function rmdir {
	Remove-Item -Recurse -Force -Path $args
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

