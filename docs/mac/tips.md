# Tips & Tricks

## How to make file executable

Suppose you have create a `run.sh` file and you want to be able to run it with `bash`. In the file, the first line should be like this:

``` none
#!/bin/sh
```

or like this:

``` none
#!/bin/bash
```

Then in the folder with your file run this command to add execute rights to the file:

``` bash
chmod u+x ./run.sh
```

Finally, you can run this file like this:

``` bash
./run.sh
```

---

## Hide/show hidden files

### The easy way

Since the release of `macOS Sierra`, when in Finder, it is now possible to use the shortcut:

``` none
CMD + SHIFT + .
```

Press once to show hidden files and again to hide them. 

### The long way

- Open `Terminal` found in `Finder > Applications > Utilities`.
- In Terminal, paste the following and press `Return`:
    ``` bash
    defaults write com.apple.finder AppleShowAllFiles YES|NO
    ```
- Hold the 'Option/alt' key, then right click on the Finder icon in the dock and click Relaunch.

---
