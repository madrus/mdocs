# Git Command Line Tools

### ConEmu

#### Show Branch Name on Command Line

Run `GitShowBranch /i` to install showing branch, `GitShowBranch /u` to uninstall.

Also, you may run your `cmd` as following (within Task contents or ConEmu's Command line)

```bash
cmd /k ver & GitShowBranch /i
```

!!! warning "Don't forget to recreate the console window!"

    If you changed the command line in the settings, you have to completely recreate the console window. Otherwise, you will not see the changes.

---

#### Add ConEmu to the Windows context menu

It is convenient to be able to open the __ConEmu__ console at the current location. You would then want to be able to either

1. right click either on the folder itself, or 
2. right click inside the white area within the folder open in the __Windows Explorer__.

Create (if not already created by the __ConEmu__ installation itself) the same group of keys and string values in the __Windows Registry__ in the following two locations respectively:

1. `HCR/Directory/shell`
2. `HCR/Directory/Background/shell`

Key: __ConEmu Here__

| Name        | Type     | Data                                     |
| :---------- | :------- | :--------------------------------------- |
| `(Default)` | `REG_SZ` | `(value not set)`                        |
| `Icon`      | `REG_SZ` | `C:\Program Files\ConEmu\ConEmu64.exe,0` |

Subkey: __command__

| Name        | Type     | Data                                                                          |
| :---------- | :------- | :---------------------------------------------------------------------------- |
| `(Default)` | `REG_SZ` | `"C:\Program Files\ConEmu\ConEmu64.exe" -here -run {cmd}`<br>`-cur_console:n` |

You can also create the __Admin__ version of the same command with minimal changes:

* Key: __ConEmu Here (Admin)__
* replace __:n__ with __:a__ at the end of the __command__ `Data` value: `-cur_console:a`

!!! note "TODO"

    It would also be nice to be able to open the __ConEmu__ folder from within the __Far Manager__ window.

### Far Manager

#### Add Far Manager to the Windows context menu

It is convenient to be able to open the __Far Manager__ at the current location. You would then want to be able to either

1. right click either on the folder itself, or 
2. right click inside the white area within the folder open in the __Windows Explorer__.

Create or rename (if already created by the __Far Manager__ installation) the same group of keys and string values in the __Windows Registry__ in the following two locations respectively:

1. `HCR/Directory/shell`
2. `HCR/Directory/Background/shell`

Key: __Far Here__

| Name        | Type     | Data                                     |
| :---------- | :------- | :--------------------------------------- |
| `(Default)` | `REG_SZ` | `(value not set)`                        |
| `Icon`      | `REG_SZ` | `C:\Program Files\Far Manager\Far.exe,0` |

Subkey: __command__

| Name        | Type     | Data                                                             |
| :---------- | :------- | :--------------------------------------------------------------- |
| `(Default)` | `REG_SZ` | `"C:\Program Files\Far Manager\Far.exe"` `"%`__X__`" "%`__X__`"` |

!!! danger "Replace X with a number!"

    In the `shell`, replace X with __1__ and in the `Background/shell` with __2__.

