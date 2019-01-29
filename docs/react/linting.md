# Linting React Apps in VSCode

## Setup

### Install Eslint and Prettier

``` bash
yarn add -D eslint prettier eslint-config-prettier eslint-plugin-prettier
```

### .eslintrc

``` json
{
  "extends": [
    "react-app",
    "plugin:prettier/recommended"
  ]
}
```

### VSCode User Settings

Enable `formatOnSave` except for JavaScript files as those are taken care of by `Eslint`.

``` json
{
  "editor.formatOnSave": true,
  "[javascript]": {
    "editor.formatOnSave": false
  },
  "eslint.autofixOnSave": true,
  "eslint.alwaysShowStatus": true,
  "prettier.disableLanguages": [
    "js"
  ],
  "files.autoSave": "onFocusChange",
  ...
}
```

### Prettier Command Line

Install a couple of plugins:

``` bash
yarn add -D husky lint-staged
```

They will help to make `prettier` focus ONLY on the files not yet staged in Git by integrating to Git hooks.

In `package.json` file, let us add a couple of things:

``` json
{
  ...
  "scripts": {
    ...
    "precommit": "lint-staged"
  },
  "lint-staged": {
    "src/**/*.{js,jsx,json,css,scss,less}": [
      "prettier --write",
      "git add"
    ]
  },
  ...
}
```

This can be simplified by `pretty-quick` plugin:

``` bash
yarn add -D pretty-quick
```

Now, the snippet above will look like this:

``` json
{
  ...
  "scripts": {
    ...
    "precommit": "pretty-quick --staged"
  },
  ...
}
```

---
