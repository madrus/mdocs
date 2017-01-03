# Some Technical Notes

[TOC]

### Font Awesome in Aurelia project

Add new `prepare-font-awesome.ts` task file to `aurelia_project/tasks`:

```javascript
import * as gulp from 'gulp';
import * as merge from 'merge-stream';
import * as changedInPlace from 'gulp-changed-in-place';
import * as project from '../aurelia.json';

export default function prepareFontAwesome() {
  const source = 'node_modules/font-awesome';
  const cssSource = `${source}/css/font-awesome.min.css`;
  const cssDest = `${project.platform.output}/css`;
  const fontsSource = `${source}/fonts/*`;
  const fontsDest = `${project.platform.output}/fonts`;

  const taskCss = gulp.src(cssSource)
    .pipe(changedInPlace({ firstPass: true }))
    .pipe(gulp.dest(cssDest));

  const taskFonts = gulp.src(fontsSource)
    .pipe(changedInPlace({ firstPass: true }))
    .pipe(gulp.dest(fontsDest));

  return merge(taskCss, taskFonts);
};
```

Add this new task to `aurelia_project/tasks/build.ts`. You will get something like this:

```javascript
import * as gulp from 'gulp';
import transpile from './transpile';
import processMarkup from './process-markup';
import processCSS from './process-css';
import { build } from 'aurelia-cli';
import * as project from '../aurelia.json';
import prepareFontAwesome from './prepare-font-awesome'; // our custom task

export default gulp.series(
  readProjectConfiguration,
  gulp.parallel(
    transpile,
    processMarkup,
    processCSS,
    prepareFontAwesome // our custom task
  ),
  writeBundles
);

function readProjectConfiguration() {
  return build.src(project);
}

function writeBundles() {
  return build.dest();
}
```

Finally, add 

```html
<link rel="stylesheet" href="scripts/css/font-awesome.min.css">
```

to `wwwroot/index.html`. Now, if you run `au build`, you will see two new directories created under `wwwwroot/scripts`:

*   css
*   fonts

and inside these folders the **Font Awesome** stylesheet and fonts.
