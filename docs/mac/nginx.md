# Web Server on MacBook Pro

It is possible to run different web servers on a Mac. I prefer __NGINX__ to Apache.

## NGINX

### Installation

Prep work:

```bash
brew doctor
brew update
brew upgrade
```

Installation:

```bash
brew install nginx
brew services start nginx
brew services stop nginx
```

Use these commands to start, stop or restart the nginx server:

```bash
sudo nginx
sudo nginx -s stop
sudo nginx -s reload
```

### nginx.conf

In the root of the main HDD, create a new `www` directory and inside it another two subdirectories: `home` and `sites`.

Now, we can edit the `nginx.conf` file to point the root server at `/www/sites` and listen on port `80`. We can use VI or NANO for that:

```bash
sudo vi /usr/local/etc/nginx/nginx.conf
sudo nano /usr/local/etc/nginx/nginx.conf
```

Scroll to the second screen and you will see something like this:

```python
server {
        listen       8080;
        server_name  localhost;

        #charset koi8-r;

        #access_log  logs/host.access.log  main;

        location / {
            root   html;
            index  index.html index.htm;
        }
        ...
}
```

Change `8080` to `80` and `root html;` to `/www/sites` or whatever other root path we created. 

!!! important "Errors 500"

    There is another chunk of code after `location`, which deals with __"500"__ errors that also has `root html` setting. Possibly, it should also be changed in the same way.

## Anciliary Tools

### dsnmasq

This is a great little tool that allows us to use wildcard subdomain names. With the default apache settings, we can add as many sites as we like in subfolders of the web root, e.g.:

* http://home.dev/client1
* http://home.dev/client2
* http://home.dev/client3

However, that creates a problem. When we have each site in a folder, it’s more difficult to manage the settings for each site. Each one must then have a different absolute root. The solution is to create a subdomain for each site, and use URLs like these:

* http://client1.dev
* http://client2.dev
* http://client3.dev

We can accomplish this by placing all three sites in our `/private/etc/hosts` file, but then we need to keep adding entries every time we add a new site. 

> __dnsmasq__ allows us to do this by interrupting each request that ends with .dev and forwarding it to a designated IP address (127.0.0.1 in our case).

The following commands will install __dnsmasq__, configure it to point all requests to the .dev top-level domain to our local machine, and make sure it starts up and runs all of the time.

```bash
brew install dnsmasq
cd $(brew --prefix); mkdir etc; echo 'address=/.dev/127.0.0.1' > etc/dnsmasq.conf
sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
sudo mkdir /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'
```

If all goes well, we’ll never need to think about it again.
