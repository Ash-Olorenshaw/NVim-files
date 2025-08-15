## NeoVim dotfiles

Just a repo where I can keep track of my NeoVim files.

I use PowerShell commands to switch between environments as I hate having one giant config.

This way I also have separate sets of buffers, history, etc per environment which is cool.

How it's done in PowerShell:

```PowerShell
# in your $PROFILE
function pnvim { 
    $env:NVIM_APPNAME = "nvim/nvim-Python" 
    Write-Host "NeoVim environment set for Python " 
}
```
