# HOWTO convert JSS to CSS with BEM

## Task

Take a CSF (Storybook's Component Story Format) component that uses JSS styling, e.g., with Styled Components, and extract the JSS-code to an external `style.scss` file using BEM naming convention.

The code is written in ES6.

## Steps

- choose a CSF-component
- remove forceReRender function
- add DEFAULT props to make the compiler guess the types
- use [JSS Playground](https://cssinjs.org/repl) to extract styles to CSS
  - get the full stylesheet from ... component when running Storybook
  - paste it into the tool source window
  - copy the CSS-in-JS under refactoring
  - paste it into the ... code section in the tool source window
  - get the CSS code from the tool target window
