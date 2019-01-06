# NPX

## What is NPX

__npx__ is a tool for running npm packages that:

- live inside of a local `node_modules` folder, or
- are not installed globally.

Example:

``` bash
# Before
$ node ./node_modules/.bin/mocha
# Now with npx:
$ npx mocha
```

> `npx` looks into the local `node_modules` folder for the package and if it can’t find it, it will download and run it without having that package globally installed.
>
> `npx` is a replacement for installing global packages. It encourages you to install packages locally, but still be able run them as if they were global, just with npx.

## Usage

### Run Local Packages

Suppose we want run `gulp` from the command prompt. We have two options. Either install `gulp` globally or not install `gulp` globally and just use `npx`:

``` bash
$ cd /path/to/project/folder
# option 1: install globally
$ npm i -D gulp gulp-cli
# option 2: don't install globally but use npx
$ npx gulp
```

### Run One-off Packages via URL

`npx` will download and execute any package you give it. This is useful for one-off commands, e.g., to check the accessibility score of a website:

``` bash
$ npx pa11y https://scottlogic.com
> Running Pa11y on URL https://scottlogic.com/
```

### Create a Boilerplate App

Creating a boilerplate React app.

``` bash
$ npx create-react-app harrys-site
```

### Run a Static Web Server

Running a static web server.

``` bash
$ cd my-website
$ npx http-server
> Starting up http-server, serving ./
> Available on:
>  http://192.168.36.65:8080
>  http://127.0.0.1:8080
> Hit CTRL-C to stop the server
```

### Deploy to a Live Server

Deploying to a [live server](https://zeit.co/now).

``` bash
$ cd my-website
$ npx now --public
> Ready! https://test-hffvgcpvvq.now.sh [2s]
```

### Execute a Package from a URL

`npx` can also execute a package from a `URL`, e.g. this [GitHub gist](https://gist.github.com/zkat/4bc19503fe9e9309e2bfaa2c58074d32):

``` bash
$ npx https://gist.github.com/zkat/4bc19503fe9e9309e2bfaa2c58074d32
> yay gist
```

## Credits

This information is taken this article: __Harry Mumford-Turner__, "[How to use npx: the npm package runner](https://blog.scottlogic.com/2018/04/05/npx-the-npm-package-runner.html)".

## Goodbye

``` bash
$ npx cowsay goodbye!
npx: installed 10 in 5.303s
 __________
< goodbye! >
 ----------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```
