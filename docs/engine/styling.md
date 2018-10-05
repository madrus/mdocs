# Custom Styling

## Theme Customization

A lot can be found on the [main website](http://squidfunk.github.io/mkdocs-material/customization/)
 itself.

The color table to choose the main and accent colors can be found on the [Getting Started](http://squidfunk.github.io/mkdocs-material/getting-started/) page.

### Themes

- [MkDocs Themes](https://github.com/mkdocs/mkdocs/wiki/MkDocs-Themes)
- 12 [Bootswatch](http://mkdocs.github.io/mkdocs-bootswatch/) themes
- [Cinder](http://sourcefoundry.org/cinder/) theme
- [Alabaster](https://github.com/iamale/mkdocs-alabaster) theme (quite simple)
- [Bootstrap](https://github.com/mkdocs/mkdocs-bootstrap) theme

### Custom Theme

!!! Note
    If you are looking for third party themes, they are listed in the MkDocs
    [community wiki](https://github.com/mkdocs/mkdocs/wiki/MkDocs-Themes).

It is possible to add extra customization via a __Custom Theme__ option.

- create `custom_theme` and `custom_theme/css` directories parallel to the `docs` directory
- inside the `custom_theme/css` directory create `extra.less` file with your styles
- use any LESS compiler to compile the `extra.less` file to the minified `extra.min.css` and its map `extra.min.css.map`
- add the following lines to `mkdoc.yml` under the `theme` variable:

``` yaml
theme
  theme_dir: custom_theme
  extra_css:
  - css/extra.min.css
```

- now when you build and serve the website, you should see the custom styling in action

Similarly, it is possible to add extra JavaScript inside the `custom_theme/js` directory. You add the corresponding setting to the `mkdocs.yml` file:

``` yaml
theme
  theme_dir: custom_theme
  extra_javascript:
  - js/your-js-file.min.js
```

The [10 Tips for Writing JavaScript without jQuery](https://tutorialzine.com/2014/06/10-tips-for-writing-javascript-without-jquery) article is a good read to write custom JavaScript without using jQuery.

---

## Extensions

### Admonition

[Admonition extension](https://pythonhosted.org/Markdown/extensions/admonition.html) for the MkDocs Markdown provides for a way to draw attention of the reader. In order to use this extension

#### Syntax

``` none
!!! special_word "some text within double quotes"
    Any number of lines aligned with the special_word
```

1. 3 exclamation marks ( __!!!__ ) at the beginning of the line
2. 1 space
3. 1 special word (see below)
4. 1 space
5. (optional) some text within double quotes
6. (optional) 1 empty line
7. (optional) any number of lines beginning at pos. 4 (aligned with the special word after the exclamation marks)

#### Special words

These special words result in a colored adminition blocks. It is nice to experiment with them.

- `note`, `seealso` - light blue
- `important`, `hint`, `tip` - green
- `warning`, `caution`, `attention` - beige/brown
- `danger`, `error` - pink/red

!!! note

    The special word can be also any other word. In that case, the color will always be light blue.

#### Examples

##### A custom text message on the first line...

``` none
!!! note "Explicit title within double quotes"

    Any number of other indented markdown elements.
    And this is the second paragraph.
```

...replaces the 1st word:

!!! note "Explicit title within double quotes"

    Any number of other indented markdown elements.
    And this is the second paragraph.

##### Any single word on the first line...

``` none
!!! hint

    You should note that the title will be automatically capitalized.
```

...will be capitalized:

!!! hint

    You should note that the title will be automatically capitalized.

##### The empty custom title...

``` none
!!! warning ""

    This is an admonition box without a title.
```

...results in no title:

!!! warning ""

    This is an admonition box without a title.

##### The word "danger" plus custom title...

``` none
!!! danger "Don't try this at home"

    Or you will regret it for the rest of your life!
```

...results in the red background:

!!! danger "Don't try this at home"

    Or you will regret it for the rest of your life!

### SmartyPants

Adding

``` yaml
- smarty:
    smart_angled_quotes: true
```

to `markdown_extentions` gives you the possibility to print out nicely looking ASCII dashes, quotes and ellipes:

|    __you write__    |    __you get__    |
|:-------------------:|:-----------------:|
|  `'single quotes'`  |  'single quotes'  |
|  `"double qoutes"`  |  "double qoutes"  |
| `<<angled quotes>>` | <<angled quotes>> |
|    `... ellipsis`   |    ... ellipsis   |
|      `-- ndash`     |      -- ndash     |
|     `--- mdash`     |     --- mdash     |

---

### nl2br extension

Adding

``` yaml
- nl2br
```

to `markdown_extentions` creates a newline within fences when you make a newline in Markdown. You type:

```none
line 1
line 2
```

Without `nl2br` you see this:

``` none
line 1 line 2
```

With `nl2br` you see this:

```none
line 1
line 2
```

---

### Lato Font

This font is one of the free Google fonts: [Lato Google Font](https://fonts.google.com/specimen/Lato?selection.family=Lato). In order to use it, the following line should be added to the `/spreadsheets/extra.css` file:

``` css
@import url('https://fonts.googleapis.com/css?family=Lato');
```

---
