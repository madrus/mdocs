# Webpack Basics

!!! INFO "Webpack 4"
    The notes hereunder are based on the latest (at the moment of writing) version 4 of Webpack.

## Webpack Architecture 101

> [Webpack](https://webpack.js.org/) is based on the [Tapable Module](https://github.com/webpack/tapable).

Here is a concise Webpack workflow description:

- the `Compiler` reads options and creates the `Compilation`
- the `Compilation` reads the `entry property`, and sends it through the `Normal Module Factory (NMF)` to the `Resolver` to find out if the file exists
- if it exists, the `Resolver` creates a `Module Object` from it with the source inside
- if some module is not in `JavaScript`, e.g. CSS, HTML, etc., the `Loaders` will transpile it into JavaScript
- then it goes through the `Parser` that converts it into an `Abstract Syntax Tree (AST)` to find all `require`s and `import`s, in other words all `dependencies`
- this process is `recursively repeated` for every dependency

Taken from the [Everything is a plugin! Mastering webpack from the inside out](https://www.youtube.com/watch?v=4tQiJaFzuJ8&t=3526s) presentation by __Sean Larkin__ at `ng-conf 2017` in Salt Lake City (UT)

More information can be found in the [Concepts](https://webpack.js.org/concepts/) section of the `Webpack` documentation.

In the [Single Page Applications with Vue.js](https://www.pluralsight.com/courses/vue-js-single-page-applications) PluralSight course, Bill Stavroulakis shows step by step how to add `webpack` and build it out together with the Vue.js solution.

---

## To Build or Not to Build

__Webpack__ is often used with two separate configuations: one for `Development` and another one for `Production`. Mostly we use the Development mode to code our project and Production when we want to prepare files for the real deployment. There is, however, a subtle difference between these two modes if one wants to create a separate `CSS` file with all the styles. The difference is as follows:

> Out of the box, loading of the CSS bundle in Development mode does not work because Webpack treats the file as a MIME type `text/html` and not `text/css`

What happens is that the Webpack loaders normally transpile everything into JavaScript. And all the resources are kept in RAM to speed up recompilations and DOM refreshment. As long as the CSS is transpiled, everything works fine. That is mostly what happens in the Development mode. However, if we force Webpack to create a separate CSS bundle using plugins like `mini-css-extract-plugin` or `extract-text-webpack-plugin`, and try to run that in Development mode, we will notice that styles are not loaded and the following error in the console:

``` none
Refused to apply style from `http://localhost:3000/style.css` because its MIME type (`text/html`) is not a supported stylesheet MIME type, and strict MIME checking is enabled.
```

However, if we CD to our `dist` folder and run a dedicated `Nodejs` server like `http-server` or `serve`, the website will be loaded and the styles will be applied.

This may also mean that we need to use two separate `index.html` files. One inside the `src` folder for Development, which does not create a separate CSS bundle. Another one in the `public` folder for Production, which load the separately created CSS bundle. In the later case, we also need to specify the `public` folder in the `html-webpack-plugin` configuration.

``` js
plugins: [
  new HtmlWebpackPlugin({
    template: 'public/index.html',
    favicon: 'public/favicon.ico',
    inject: false,
    hash: true,
  }),
  ...
]
```

!!! INFO "Performance"
    The overal time-to-load when building a separate CSS bundle is much longer than when not doing that.

---
