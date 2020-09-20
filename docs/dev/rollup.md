# Rollup to Build Your Website

Here is an example of my `rollup.config.js` which minifies `.CSS` and uglifies `.js`:

``` js
// New to rollup read https://www.learnwithjason.dev/blog/learn-rollup-js/

import path from 'path'
import cssnano from 'cssnano'
import alias from '@rollup/plugin-alias'
import babel from '@rollup/plugin-babel'
import commonjs from '@rollup/plugin-commonjs'
import nodeResolve from '@rollup/plugin-node-resolve'
import peerDepsExternal from 'rollup-plugin-peer-deps-external'
import postcss from 'rollup-plugin-postcss'
import scss from 'rollup-plugin-scss'
import { terser } from 'rollup-plugin-terser' // to minify if necessary

// const packageJson = require('./package.json')

const config = {
  input: 'src/index.js',
  output: [
    {
      file: 'build/index.js',
      format: 'esm',
    },
    {
      file: 'build/index.min.js',
      format: 'esm',
      plugins: [terser()],
    },
    // {
    //   name: 'rfhui', // packageJson.name,
    //   file: packageJson.main,
    //   format: 'umd',
    //   sourcemap: false,
    //   globals: {
    //     react: 'React',
    //     'react-dom': 'ReactDOM'
    //   }
    // },
    // {
    //   file: packageJson.module,
    //   format: 'esm',
    //   sourcemap: false,
    //   globals: {
    //     react: 'React',
    //     'react-dom': 'ReactDOM'
    //   }
    // }
  ],
  external: ['react', 'react-dom', '@material-ui'],
  plugins: [
    peerDepsExternal(),
    // https://mauricius.dev/use-import-aliases-in-rollup-module-bundler/
    alias({
      entries: {
        '@': path.join(__dirname, '/src'),
        // { find: ' @/floriday-icons', replacement: './src/floriday-icons' }
        // { find: '@/components', replacement: './src/components' }
      },
    }),
    nodeResolve(),
    babel({
      exclude: 'node_modules/**',
      presets: ['@babel/env', '@babel/preset-react'],
      plugins: ['@babel/plugin-proposal-class-properties'],
      babelHelpers: 'bundled',
    }),
    commonjs(),
    scss(),
    postcss({
      extract: true,
      minimize: true,
      plugins: [cssnano()],
      sourceMap: true,
    }),
  ],
}

export default config
```
