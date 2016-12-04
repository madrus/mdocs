# Some technical details

[TOC]

## Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.

## Useful Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs help` - Print this help message.

## Font Awesome

[Font Awesome](https://fortawesome.github.io) gives you scalable vector icons that can instantly be customized -- size, color, drop shadow, and anything that can be done with the power of CSS. For more inpiration see these [examples](http://fontawesome.io/examples/).

[Font Awesome Markdown](http://bmcorser.github.io/fontawesome-markdown/) is a Markdown extension that looks for things like `:fa-coffee:` (:fa-coffee:) or `:fa-refresh:` (:fa-refresh:) and replaces them with the Font Awesome icon markup.

**Examples**

This examples use the fontawesome_markdown extension:

```none
What would you drink, :fa-coffee: or :fa-beer:?
```

What would you drink, :fa-coffee: or :fa-beer:?

For this example, you must install the `fontawesome_markdown` extension with `pip`. Right now version `0.2.5` is the latest but it doesn't work out of the box. Instead, you have to install the latest version from the github repository. You can do that with the command below:

```bash
pip install https://github.com/bmcorser/fontawesome-markdown/archive/master.zip
```

You may need to include **-U** in the above command if you already have this extension installed.

Then add the below to your `mkdocs.yml` file.

```none
markdown_extensions:
  - fontawesome_markdown`
```
