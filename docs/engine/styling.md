# Custom Styling

## Admonition extension

!!! warning "This does not always work correctly with Material theme"
    Unfortunately, with Material theme this does not always give correct result. It works fine with the standard ReadTheDocs theme though.

[Admonition extension](https://pythonhosted.org/Markdown/extensions/admonition.html) for the MkDocs Markdown provides for a way to draw attention of the reader. In order to use this extension

**Syntax**

```none
!!! special_word "some text within double quotes"
    Any number of lines aligned with the special_word
```

1. 3 exclamation marks ( **!!!** ) at the beginning of the line
2. 1 space
3. 1 special word (see below)
4. 1 space
5. (optional) some text within double quotes
6. (optional) any number of lines beginning at pos. 4 (aligned with the special word after the exclamation marks)

**Special words**

These special words result in a colored adminition blocks. It is nice to experiment with them.

* `note`, `seealso` - light blue
* `important`, `hint`, `tip` - green
* `warning`, `caution`, `attention` - beige/brown
* `danger`, `error` - pink/red

**NOTE:** The special word can be also any other word. In that case, the color will always be light blue.

**Some examples**

A custom text message on the first line...

```none
!!! note "Explicit title within double quotes"
    Any number of other indented markdown elements.
    This is the second paragraph.
```

...replaces the 1st word:

!!! note "Explicit title within double quotes"
    Any number of other indented markdown elements.
    This is the second paragraph.

Any single word on the first line...

```none
!!! hint
    You should note that the title will be automatically capitalized.
```

...will be capitalized:

!!! hint
    You should note that the title will be automatically capitalized.

The empty custom title...

```none
!!! warning ""
    This is an admonition box without a title.
```

...results in no title:

!!! warning ""
    This is an admonition box without a title.

The word "warning" plus custom title...

```none
!!! danger "Don't try this at home"
    Or you will regret it for the rest of your life!
```

...results in the red background:

!!! danger "Don't try this at home"
    Or you will regret it for the rest of your life!

## SmartyPants extension

Adding 

```yaml
  - smarty:
      smart_angled_quotes: true
```

to `markdown_extentions` gives you the possibility to print out nicely looking ASCII dashes, quotes and ellipes:

You write:

```none
'single quotes'
"double qoutes"
<<angled quotes>>
... ellipsis
-- ndash
--- mdash
```

You get:

'single quotes'
"double qoutes"
<<angled quotes>>
... ellipsis
-- ndash
--- mdash

## nl2br extension

Adding 

```yaml
  - nl2br
```

to `markdown_extentions` creates a newline within fences when you make a newline in Markdown. You type:

```none
line 1
line 2
```

Without `nl2br` you see this:

```none
line 1 line 2
```

With `nl2br` you see this:

```none
line 1
line 2
```
