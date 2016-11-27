# Custom Styling

## Admonition extension for Markdown

[Admonition extension](https://pythonhosted.org/Markdown/extensions/admonition.html) for the MkDocs Markdown provides for a way to draw attention of the reader. The syntax is as follows:

1. 3 exclamation marks (**!!!**) at the beginning of the line
2. 1 space
3. 1 word, some words are special (see below)
4. 1 space
5. (optional) some text within double quotes
6. (optional) any number of lines beginning at pos. 4 (aligned with the 1st word after the exclamation marks)

Here are some examples. 

A custom text message on the first line...

```text
!!! type "Explicit title within double quotes"
    Any number of other indented markdown elements.

    This is the second paragraph.
```

...replaces the 1st word:

!!! type "Explicit title within double quotes"
    Any number of other indented markdown elements.

    This is the second paragraph.

Any single word on the first line...

```text
!!! info
    You should note that the title will be automatically capitalized.
```

...will be capitalized:

!!! info
    You should note that the title will be automatically capitalized.

The empty custom title...

```text
!!! important ""
    This is an admonition box without a title.
```

...results in no title:

!!! important ""
    This is an admonition box without a title.

The word "warning" plus custom title...

```text
!!! warning "Don't try this at home"
    Or you will regret it for the rest of your life!
```

...results in the red background:

!!! warning "Don't try this at home"
    Or you will regret it for the rest of your life!
