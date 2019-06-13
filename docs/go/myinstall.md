# Installation Notes

## MAC OS X

On my MAC OS X, I ended up installing and using `Go` from the official `.dmg` package from the [Go website](https://golang.org/).

!!! ERROR "Installation Issues"

    I have had bad experience when trying to use [Homebrew](https://brew.sh/) or [GVM](https://github.com/moovweb/gvm). Probably because I tried to install new installation option without properly cleaning everything from the previous one.

The following files may have "traces" of different settings:

- `~/.bash_profile`
- `~/.bashrc`
- `~/.profile`

My Go environment variables are all defined in `~/.bash_profile`.

### Troubleshooting

#### Uninstalling Go

Uninstalling `Golang` from `Mac OS X` machine can be done easily. All you to do is the remove this directory `/usr/local/go`. Doing this will remove the binaries for `Golang` but not the residue files which you have installed elsewhere.

To remove the additional files, you need to check the environment variables for `GOPATH` and `GOROOT`. Those the files that you need to delete as well if you plan to remove `Golang` entirely.

#### Version Mismatch During Build

`go build` produces the following error message:

``` none
compile: version "go1.10.3" does not match go tool version "go1.11"
```

- Check if you have more than one version of `Go` installed (e.g. `.dmg`, `Homebrew`, or `gvm`). If more than one, remove all except the one you want to use.
- Analyse:
    - `which go`
    - `go version`
    - `go env`
    - `cat /usr/local/go/VERSION`

---
