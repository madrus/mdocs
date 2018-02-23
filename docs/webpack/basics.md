## Webpack Architecture 101

> [Webpack](https://webpack.js.org/) is based on the [Tapable Module](https://github.com/webpack/tapable).

Here is a concise Webpack workflow description:

- the `Compiler` reads option and create the `Compilation`
- the `Compilation` reads the `entry property`, and sends it through the `Normal Module Factory (NMF)` to the `Resolver`to find out if the file exists
- if it exists, the `Resolver` creates a `Module Object` from it with the source inside
- if some module is not in `JavaScript`, e.g. CSS, HTML, etc., the `Loaders` will transpile it into JavaScript
- then it goes through the `Parser` that converts it into an `Abstract Syntax Tree (AST)` to find all `require`s and `import`s, in other words all `dependencies`
- this process is `recursively repeated` for every dependency

Taken from the [Everything is a plugin! Mastering webpack from the inside out](https://www.youtube.com/watch?v=4tQiJaFzuJ8&t=3526s) presentation by __Sean Larkin__ at `ng-conf 2017` in Salt Lake City (UT)

More information can be found in the [Concepts](https://webpack.js.org/concepts/) section of the `Webpack` documentation.

---
