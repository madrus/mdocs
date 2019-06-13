# Homebrew Utility

## Updates

Here is a `Terminal` alias to get all the updating to happen with a single word `brewery` command:

``` bash
alias brewery='brew update && brew upgrade && brew cleanup'
```

Source: [this tip of Konstantin](https://medium.com/@kkostov/how-to-install-node-and-npm-on-macos-using-homebrew-708e2c3877bd)

---

## Results of the first run

When I ran it the first time, I got a lot of hints about various upgraded components. I have made note of those I considered important.

### openssl@1.1 -> 1.1.1

A CA file has been bootstrapped using certificates from the system keychain. To add additional certificates, place `.pem` files in `/usr/local/etc/openssl@1.1/certs`

and run `/usr/local/opt/openssl@1.1/bin/c_rehash`

`openssl@1.1` is keg-only, which means it was not symlinked into `/usr/local`, because this is an alternate version of another formula.

If you need to have `openssl@1.1` first in your `PATH` run:

``` bash
echo 'export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"' >> ~/.bash_profile
```

For compilers to find `openssl@1.1` you may need to set:

``` bash
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
```

For `pkg-config` to find `openssl@1.1` you may need to set:

``` bash
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
```

### mariadb

A `/etc/my.cnf` from another install may interfere with a Homebrew-built server starting up correctly.

`MySQL` is configured to only allow connections from `localhost` by default.

To connect: 

``` bash
mysql -uroot
```

To have launchd start mariadb now and restart at login:

``` bash
brew services start mariadb
````

Or, if you don\'t want/need a background service you can just run:

``` bash
mysql.server start
```

### nginx

`Docroot` is: `/usr/local/var/www`

The default port has been set in `/usr/local/etc/nginx/nginx.conf` to `8080` so that
`nginx` can run without sudo.

`nginx` will load all files in `/usr/local/etc/nginx/servers/`.

To have launchd start `nginx` now and restart at login:

``` bash
brew services start nginx
```

Or, if you don't want/need a background service you can just run:

``` bash
nginx
```

### docker-machine

Bash completion has been installed to:

``` none
/usr/local/etc/bash_completion.d
```

zsh completions have been installed to:

``` none
/usr/local/share/zsh/site-functions
```

To have it launched start `docker-machine` now and restart at login:

``` bash
brew services start docker-machine
```

Or, if you don't want/need a background service you can just run:

``` bash
docker-machine start
```

---
