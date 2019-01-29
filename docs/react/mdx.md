# MDX Tools

MDX is a format that lets you seamlessly use JSX in your Markdown documents. You can import components, like interactive charts or notifs, and export metadata. For more details, see the [official website](https://mdxjs.com/) and the [Github repo](https://github.com/mdx-js/mdx).

## MDX-DECK

[mdx-deck](https://github.com/jxnblk/mdx-deck) is a great library for building slides using Markdown and JSX. It makes creation of dynamic slide presentations a breeze. See [here](https://jxnblk.com/mdx-deck/) a good live working example of it. Here are the most important features:

- 📝 Write presentations in markdown
- ⚛️ Import and use React components
- 💅 Customizable themes and components
- 0️⃣ Zero-config CLI
- 💁 Presenter mode
- 📓 Speaker notes

More documentation can be found in a bunch of `.mdx` files [here](https://github.com/jxnblk/mdx-deck/tree/master/docs).

__Kent C. Dodds__ has a nice how-to video about mdx-deck: [What is MDX](https://www.youtube.com/watch?v=d2sQiI5NFAM&list=PLV5CVI1eNcJgCrPH_e6d57KRUTiDZgs0u). Another, maybe even better video has been published by __Daniel Persson__ (see the [code-surfer plugin](#code-surfer-plugin) section).

Another presentation by __Jason Gretz__ on `mdx-deck` can be found inside the [Vue.js Developer Experience & MDX Slides](https://www.youtube.com/watch?v=UW6YycsYzHY) video between `09:55` and `47:40`. It is called _Sensational Slides with Markdown and JSX_.

### Build a Custom Provider Component for MDX Deck

Creating a custom Provider component allows you to change the markup of the entire deck. This lets you put things like logos and social media handles in each slide easily.

Here is how to create a basic custom `Provider` that adds a `Twitter` handle to the bottom right corner of every slide. (This tutorial comes from this lesson: [Build a Custom Provider Component for MDX Deck](https://egghead.io/lessons/javascript-build-a-custom-provider-component-for-mdx-deck))

What you see here is that I have several slides in an `mdx-deck`. We're going to create a custom provider component in order to place markup on every single one of our slides. To do this requires three steps. Step one, we need to create a custom theme, step two, we need to create that custom provider component, and step three, we need to export our theme into the mdx-deck.

#### 1. Create a Provider.js component

Let's start by creating our custom theme. In order to get started, we're going to import a theme from mdx-deck theme, so we're going to use the default one. Next, we'll import our provider component even though we haven't created it yet. Finally, we'll export an object that's a combination of the theme provided by mdx-deck in our custom provider.

In this step, we're going to create our custom provider. We'll start by importing React, since we'll need it for our JSX. We'll create a simple provider component that just passes the children down to a div. Let's make sure to export our provider.

If you are like me, you might like putting your twitter handle on every slide in your deck, so that people can easily find you on social media.

We'll create a div and we'll use the style object in order to position it in the bottom right. You could use style components or CSS. It doesn't really matter. Our position is absolutely, and I'll position it 1em from the bottom and 1em from the right.

Next, I'll add a link that points to my twitter profile and add my handle as the text. We save it and we see that it's on every single slide.

``` jsx
import React from 'react'
import ThemeProvider from 'mdx-deck/dist/Provider'

const Provider = ({ children, ...rest }) => (
  <ThemeProvider {...rest}>
    {children}

    <div
      style={{
        position: 'absolute',
        bottom: '1em',
        right: '1em'
      }}
    >
      <a href="https://twitter.com/madrusnl">
        @madrusnl
      </a>
    </div>
  </ThemeProvider>
)

export default Provider
```

#### 2. Create a theme.js component

``` jsx
import theme from 'mdx-deck/themes'
import Provider from './Provider'

export default {
  ...theme,
  Provider
}
```

#### 3. Use it in your deck

The last step is to export our theme into our mdx-deck.

``` jsx
export { default as theme } from './theme.js'

# Step 1: Create a Custom Theme

---

# Step 2: Create a Custom Provider

---

# Step 3: Export Our Theme in the mdx-deck

```

### Deploy MDX-Deck to Netlify

Here is how: [Deploy MDX-Deck to Netlify](http://whoisryosuke.com/blog/2018/mdx-deck-on-netlify/).

### Code Surfer Plugin

- [Github repo](https://github.com/pomber/code-surfer)
- [MDX Deck example slide deck](https://codesurfer.js.org/sample/)
- [Highlight, Scroll, & Zoom Code Snippets in mdx-deck with Code Surfer <🏄/>](https://elijahmanor.com/code-surfer/)

__Daniel Persson__ has published a great video: [Building a slide deck in mdx-deck](https://www.youtube.com/watch?v=e7iVpOliFuk). Here is a link to his corresponding [repository](https://github.com/kalaspuffar/mdx-deck-example) using the `code-surfer` plugin. This repo contains a `.mdx` file showing different usages of the plugin.

---

## MDX DOCS

[MDX Docs](https://mdx-docs.now.sh) is a live documentation creation environment based on [MDX](https://mdxjs.com/) and [Next.js](https://nextjs.org/).

Here is a good [example](https://github.com/timothyis/mdx-example), see also this [live demo](https://mdx-example.zeit.sh/) based on it.

---

## MDX and Gatsby

See these links:

1. [Gatsby+MDX: Bringing MDX to Gatsby for ambitious projects](https://gatsby-mdx.netlify.com/)
1. [Official MDX Gatsby example](https://github.com/mdx-js/mdx/tree/master/examples/gatsby)
1. [Getting started](https://mdxjs.com/getting-started/gatsby)
1. [gatsby-plugin-mdx](https://www.gatsbyjs.org/packages/gatsby-plugin-mdx/)
1. [Building a Video Blog with Gatsby and Markdown (MDX)](https://scotch.io/tutorials/building-a-video-blog-with-gatsby-and-markdown-mdx) (2019)
1. [Generate documentation for any React project using GatsbyJS](http://whoisryosuke.com/blog/2018/gatsby-documentation-starter/) and the corresponding [Github repo](https://github.com/whoisryosuke/gatsby-documentation-starter)
1. [Gatsby MDX Blog Starter Project](https://github.com/rwieruch/gatsby-mdx-blog-starter-project)

### gatsby-mdx plugin

The `gatsby-mdx` plugin allows you to create pages in a Gatsby project using `.mdx` files. If you prefer the `.md` extension on your markdown files, then you can adjust the plugin options to allow that.

```jsx
// gatsby-config.js
plugins: [
  {
    resolve: `gatsby-mdx`,
    options: {
      extensions: [".mdx", ".md"]
    }
  }
]
```

This tells `gatsby-mdx` to recognize both `.mdx` and `.md` extensions when processing files.

(Taken from [Allow md As An Extension With gatsby-mdx](https://til.hashrocket.com/posts/0niz0nfdal-allow-md-as-an-extension-with-gatsby-mdx).)

---

## Docz

Definitely watch the featured video on the [Docz website](https://www.docz.site/)!

---
