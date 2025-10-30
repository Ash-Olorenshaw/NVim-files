function pnvim { 
	    $env:NVIM_APPNAME = "nvim/nvim-Python" 
	    Write-Host "NeoVim environment set for Python " 
}

function onvim { 
	    $env:NVIM_APPNAME = "nvim/nvim-Odin" 
	    Write-Host "NeoVim environment set for Odin " 
}

function fnvim { 
	    $env:NVIM_APPNAME = "nvim/nvim-FSharp" 
	    Write-Host "NeoVim environment set for F# "
}

function csnvim { 
	    $env:NVIM_APPNAME = "nvim/nvim-CSharp" 
	    Write-Host "NeoVim environment set for C# "
}

function jnvim { 
	    $env:NVIM_APPNAME = "nvim/nvim-Java" 
	    Write-Host "NeoVim environment set for Java " 
}

function jsnvim { 
	    $env:NVIM_APPNAME = "nvim/nvim-JavaScript" 
	    Write-Host "NeoVim environment set for JavaScript " 
}

function powernvim { 
	    $env:NVIM_APPNAME = "nvim/nvim-Powershell" 
	    Write-Host "NeoVim environment set for Powershell " 
}

function cnvim { 
	    $env:NVIM_APPNAME = "nvim/nvim-C" 
	    Write-Host "NeoVim environment set for C/C++ and MetaQuotes4 " 
}

function phpnvim { 
	    $env:NVIM_APPNAME = "nvim/nvim-Php" 
	    Write-Host "NeoVim environment set for Php " 
}

function testnvim { 
	    $env:NVIM_APPNAME = "nvim/nvim-Testbed" 
	    Write-Host "NeoVim environment set for testing plugins, etc " 
}

function cjnvim { 
	    $env:NVIM_APPNAME = "nvim/nvim-Clojure" 
	    Write-Host "NeoVim environment set for Clojure " 
}

function nnvim { 
	    $env:NVIM_APPNAME = "nvim/nvim-Nim" 
	    Write-Host "NeoVim environment set for Nim " 
}

function unsetnvim { 
	    $env:NVIM_APPNAME = "" 
	    Write-Host "NeoVim environment successfully unset. " 
}
