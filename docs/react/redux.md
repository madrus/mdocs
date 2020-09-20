# Redux

## Three Principles of Redux

From the Egghead.io course of Dan Abramov:

1. Application __state__ is one single object no matter how big or small the application.
1. State tree is __immutable__ (read only). State changes can be added but not modified.
1. State mutations are pure functions that take the previous state and the action being dispatched as its arguments, and returns the next state of the application. These functions are called __reducers__.

## Redux conventions

1. If the reducer receives `undefined` as the state argument, it must return what it considers to be the __initial state__ of the application.

## The Store

The __store__ binds together the `three principles of Redux`. It holds the current application's state object. It lets you dispatch actions. When you create it, you need to specify the reducer that tells how state is updated with actions.

### createStore()

The `createStore` function from `Redux` and the `store` object it returns __provide__:

- the `getState` method to get the current application state;
- the `dispatch` method, to change the current application state by dispatching an action, and;
- the `subscribe` method to subscribe to the changes and re-render our application with the current state of the app.

The following declarations are the same:

``` js
const { createStore } = React
import { createStore } from 'redux'
var createStore = Redux.createStore
```

### Three Store Methods

- `getState()`
- `dispatch()`
- `subscribe()`

#### getState()

``` js
// getState
console.log(store.getState())
```

#### dispatch()

``` js
// dispatch
store.dispatch({ type: 'INCREMENT' })
console.log(store.getState())
```

#### subscribe()

``` js
// subscribe
store.subscribe(render)
```
