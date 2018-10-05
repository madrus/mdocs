# Theme Color Styling

__Martin Donath__ a.k.a. __SquidFunc__, the author of the beautiful [MkDocs Material](https://squidfunk.github.io/mkdocs-material/) theme for the famous [MkDocs](https://www.mkdocs.org/) documentation site generator has written a big [Getting Started](https://squidfunk.github.io/mkdocs-material/getting-started/) guide.

I have used this theme and this guide to set up this website with my personal documentation. I was fascinated by the styling section in relation to colors and accents. The big question however was how to achieve the effect of rows of color swatches instead of one long column. I have not figured out how Martin did it on his website. Instead, I have managed to achieve the same by using `<div class="flex-container">` inline in the Markdown document (see the source code of this page in my repo). So, I have included the color sections of the official guide to demo this alternative approach.

## Color palette

A default hue is defined for every primary and accent color on Google's
Material Design [color palette][10], which makes it very easy to change the
overall look of the theme. Just set the primary and accent colors using the
following variables:

``` yaml
theme:
  palette:
    primary: 'indigo'
    accent: 'indigo'
```

Color names are case-insensitive, but must match the names of the Material
Design color palette. Valid values are: `red`, `pink`, `purple`, `deep purple`,
`indigo`, `blue`, `light blue`, `cyan`, `teal`, `green`, `light green`, `lime`,
`yellow`, `amber`, `orange`, `deep orange`, `brown`, `grey`, `blue grey` and
`white`. The last four colors can only be used as a primary color.

If the color is set via this configuration, an additional CSS file that
defines the color palette is automatically included. If you want to keep things
lean, clone the repository and recompile the theme with your custom colors set.

[10]: http://www.materialui.co/colors

## Primary colors

> Default: `indigo`

Click on a tile to change the primary color of the theme:

<div class="flex-container">
<button data-md-color-primary="red">Red</button>
<button data-md-color-primary="pink">Pink</button>
<button data-md-color-primary="purple">Purple</button>
<button data-md-color-primary="deep-purple">Deep Purple</button>
<button data-md-color-primary="indigo">Indigo</button>
<button data-md-color-primary="blue">Blue</button>
<button data-md-color-primary="light-blue">Light Blue</button>
<button data-md-color-primary="cyan">Cyan</button>
<button data-md-color-primary="teal">Teal</button>
<button data-md-color-primary="green">Green</button>
<button data-md-color-primary="light-green">Light Green</button>
<button data-md-color-primary="lime">Lime</button>
<button data-md-color-primary="yellow">Yellow</button>
<button data-md-color-primary="amber">Amber</button>
<button data-md-color-primary="orange">Orange</button>
<button data-md-color-primary="deep-orange">Deep Orange</button>
<button data-md-color-primary="brown">Brown</button>
<button data-md-color-primary="grey">Grey</button>
<button data-md-color-primary="blue-grey">Blue Grey</button>
<button data-md-color-primary="white">White</button>
</div>

<script>
  var buttons = document.querySelectorAll("button[data-md-color-primary]");
  Array.prototype.forEach.call(buttons, function(button) {
    button.addEventListener("click", function() {
      document.body.dataset.mdColorPrimary = this.dataset.mdColorPrimary;
    })
  })
</script>

## Accent colors

> Default: `indigo`

Click on a tile to change the accent color of the theme:

<div class="flex-container">
<button data-md-color-accent="red">Red</button>
<button data-md-color-accent="pink">Pink</button>
<button data-md-color-accent="purple">Purple</button>
<button data-md-color-accent="deep-purple">Deep Purple</button>
<button data-md-color-accent="indigo">Indigo</button>
<button data-md-color-accent="blue">Blue</button>
<button data-md-color-accent="light-blue">Light Blue</button>
<button data-md-color-accent="cyan">Cyan</button>
<button data-md-color-accent="teal">Teal</button>
<button data-md-color-accent="green">Green</button>
<button data-md-color-accent="light-green">Light Green</button>
<button data-md-color-accent="lime">Lime</button>
<button data-md-color-accent="yellow">Yellow</button>
<button data-md-color-accent="amber">Amber</button>
<button data-md-color-accent="orange">Orange</button>
<button data-md-color-accent="deep-orange">Deep Orange</button>
</div>

<script>
  var buttons = document.querySelectorAll("button[data-md-color-accent]");
  Array.prototype.forEach.call(buttons, function(button) {
    button.addEventListener("click", function() {
      document.body.dataset.mdColorAccent = this.dataset.mdColorAccent;
    })
  })
</script>

A default hue is defined for every primary and accent color on Google's Material Design color palette, which makes it very easy to change the overall look of the theme. Just set the primary and accent colors using the following variables:

``` yaml
theme:
  palette:
    primary: 'indigo'
    accent: 'indigo'
```

Color names are case-insensitive, but must match the names of the Material Design color palette. Valid values are: `red`, `pink`, `purple`, `deep purple`, `indigo`, `blue`, `light blue`, `cyan`, `teal`, `green`, `light green`, `lime`, `yellow`, `amber`, `orange`, `deep orange`, `brown`, `grey`, `blue grey` and `white`. The last four colors can only be used as a primary color.

!!! TIP "Compile your own custom color theme"

    If the color is set via this configuration, an additional CSS file that defines the color palette is automatically included. If you want to keep things lean, __clone the repository and recompile the theme with your custom colors set__. See the [guide on customization](http://wiljenumdesign.nl/customization/) for more information.

---
