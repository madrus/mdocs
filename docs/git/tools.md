# Git Command Line Tools

[TOC]

---
### ConEmu

Here is the main link to [Conemu](https://conemu.github.io/) website. 

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

---

### Cmder

This tool combines most of the features of [Conemu](#conemu) and [Clink](https://mridgers.github.io/clink/).

#### Environment variables

!!! warning "No spaces in the path names!"

    Make sure there are no spaces in the path. If necessary, substitute those paths with their short versions. You can find them by running `dir /X` in their parent directory.

Add the following environment system variables to Windows according to your specific situation:

`CMDER_ROOT = C:\PROGRA~1\Cmder`

Add the path to `Cmder.exe` to the `PATH` variable:

`C:\PROGRA~1\Cmder`

#### Shortcut to open Cmder in a chosen folder

1. Open a terminal as an __Administrator__
2. Navigate to the directory in which you have placed __Cmder__
3. Execute `.\cmder.exe /REGISTER ALL`. If you get _"Access Denied"_ ensure you are executing the command in an __Administrator__ prompt

In the Windows explorer window right click in or on a directory to see `Cmder Here` in the context menu.

#### Configuring Tasks

Here is a good example of how to configure the environment for editing files not related to Visual Studio and .NET. Another neat functionality are customized Tasks. Use those to store different project workspaces. One task equals one workspace. Thanks to that it is possible to easily start another 'project' and initialize it by opening specific folders and specific files in Vim. It is a lot faster than doing everything manually.

In the Settings navigate to __Startup -> Tasks__ and create a new predefined task with a "+" sign. Then add this code:

```bash
-new_console:d:C:\Users\mfranc\Dropbox "%ProgramFiles(x86)%\Vim\vim80\vim.exe" /k
-new_console:d:D:\ "%ProgramFiles%\Vim\vim74\vim.exe" /k -cur_console:n
-cur_console:d:D:\ "%ProgramFiles%\Git\bin\sh.exe" --login -i -cur_console:n:sT25V
-cur_console:d:D:\ "%ProgramFiles%\Git\bin\sh.exe" --login -i cur_console:n:sT66H cmd.exe -new_console:d:D:\ -i -cur_console:n:sT50H
```

What does those commands do? 

1. Creates new screen and opens Vim in my Dropbox folder context
2. Creates new screen with Vim pointing to D:\
3. Initializes shell in this new window and splits current screen into `75%/25% horizontaly`
4. Initializes shell in new (25%) window and splits it up into `33.3%/66.6% vertically`. Then initializes shell in the new (66.6%) window and splits it up into `50%/50% vertically`.

#### Aliases

You can create an alias to any command by an `alias` command, e.g.:

```bash
alias push=git push -u $*
```

!!! warning "No space in between!"

    Make sure there is no space between the alias and the equality sign `=`

Undo the alias by `unalias push`.

The aliases can be found in `config` subdirectory of the cmder install directory in the `user-aliases.cmd` file or by running `alias` command with no parameters.

#### Standard Aliases

* `cmderr` - open cmder window in the cmder install directory, e.g. `C:\Program Files\Cmder`
* `history` - show latest commands

#### How to update ConEmu within Cmder

__Maximus5__, the author of Cmder, explains how to update ConEmu to a new version. Current Cmder can contain an older ConEmu version. To update ConEmu, get the new package from the [ConEmu website](https://conemu.github.io) and copy its content to 'your cmder installation'/vendor/conemu-maximus5 folder.

#### Links

* [Cmder: Super Command Line Tool Window](https://www.youtube.com/watch?v=ncBPkuhpszY)

---

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

---
