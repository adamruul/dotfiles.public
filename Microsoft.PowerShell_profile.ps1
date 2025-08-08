Set-Alias -name vim -Value nvim

function rmdir {
	Remove-Item -Recurse -Force -Path $args
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

