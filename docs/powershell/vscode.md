!!! WARNING ""

    This article describes the new version of PowerShell, `PowerShell Core v6.0`, which is a new generation of Powershell. It is cross-platform and at the moment implements only the most important functionality. Unfortunately, it has no modules to manage IIS.

## Recommended Prerequisites

To effectively debug `PowerShell` in `Visual Studio Code` you might consider to carry out the following steps:

- install `PowerShell` VS Code extension
- install the latest version of `PowerShell Core` (at the moment of writing this article, it was version `6.0.2`) from its [GitHub repo](https://github.com/PowerShell/Powershell)
- add the installation path to the Windows environment `PATH` variable:
    `C:\Program Files\PowerShell\<version>\` 
- add the corresponding line to your VS Code settings:
``` json
// On Windows:
"powershell.powerShellExePath": "C:/Program Files/PowerShell/<version>/pwsh.exe"
// On Linux:
"powershell.powerShellExePath": "/opt/microsoft/powershell/<version>/pwsh"
// On macOS:
"powershell.powerShellExePath": "/usr/local/microsoft/powershell/<version>/pwsh"
```

Now, when you start the VS Code you will notice that it is using the installed `PowerShell Core` as its integrated terminal.

---

## Debugging

When you open your PowerShell file in the VS Code window, you can run it in the debugger mode. If you have not done it yet, initialize the `launch.json` configuration file by choosing the `bug` icon in the left side menu. Now, click on the gear icon at the top of the screen. The `launch.json` file will be created if necessary and open in the editor window. Probably the second configuration with look something like this:

``` json
{
  "type": "PowerShell",
  "request": "launch",
  "name": "PowerShell Launch Current File",
  "script": "${file}",
  "args": [],
  "cwd": "${file}"
},
```

Now, switch back to your PowerShell file in the editor window and set breakpoints where you need them. Choose `PowerShell Launch Current File` option in the `Debug` menu above, and click on the green triangle to run the script in the debugger mode. The debugger will stop at the first breakpoint it encounters.

!!! NOTE ""

    A nice feature of the PowerShell debugger is that it can __also__ debug inside the invoked commands, e.g by `Invoke-Command`. Just stop the debugger at the line with `Invoke-Command` first. From that breakpoint, you can go inside the invoked block by stepping inside it, e.g with `F11`.

---
