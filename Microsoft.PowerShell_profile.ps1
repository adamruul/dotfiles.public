Set-Alias -name vim -Value nvim

function rmdir {
	Remove-Item -Recurse -Force -Path $args
}

function myip {
        echo "Resolving IP..."
       
	    # External IP
        $MyExternalIP = (Invoke-WebRequest ifconfig.me/ip).Content.Trim()


        # Internal IP
        $MyInternalIP = (
        Get-NetIPConfiguration |
        Where-Object {
                $_.IPv4DefaultGateway -ne $null -and
                $_.NetAdapter.Status -ne "Disconnected"
        }
        ).IPv4Address.IPAddress


        # Hostname
        $MyHostname = [System.Net.Dns]::GetHostByAddress("$MyInternalIP").Hostname

        echo "-----------------------------------"
        echo "Hostname: `t$MyHostname"
        echo "Internal IP: `t$MyInternalIP"
        echo "External IP: `t$MyExternalIP"
        echo "-----------------------------------"
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

