# Go Notes

## Go Toolset

### Go Playground

[Go Playground](https://play.golang.org/) is a great tool to try out your code snippets.

### Local Go Documentation

The Go documentation is also available in a browsable format. This gives you `godoc` documentation as a local web server. To start your own documentation server, type:

``` bash
godoc -http=:6060
```

This command instructs `godoc` to start a web server on local port `6060`. If you open your web browser and navigate to <http://localhost:6060>, you’ll see a web page with documentation for both the Go standard libraries and any Go source that lives in your `GOPATH`.

The best part of Go’s documentation tool is that it works for your code, too. If you follow simple conventions while writing your code, it will automatically include your comments in the Go documentation generated by `godoc`. To be included in the godoc generated documentation, your code needs to be documented by adding comments that follow a specific convention. Start by adding comments directly above the identifiers you want to document. This works for packages, functions, types, and global variables. Comments can be started using either two slashes, or using the slash-asterisk style.

``` go
// Retrieve connects to the configuration repository and gathers
// various connection settings, usernames, passwords. It returns a
// config struct on success, or an error.
func Retrieve() (config, error) {
// ... omitted
}
```

If you want to add a large body of text to document your package, include a file called `doc.go` that declares the same package as your project, and put your package introduction as a comment before the package declaration:

``` go
/*
  Package usb provides types and functions for working with USB
  devices. To connect to a USB device start by creating a new USB
  connection with NewConnection
  ...
*/
package usb
```

This package documentation will be shown before any type or function documentation is displayed for your package. It also demonstrates using the slash-asterisk type of comment. You can read more about creating good documentation for your code by searching for _golang documentation_ in Google.

---

## Dependency Management

### GODEP

[GODEP](https://github.com/tools/godep) is a dependency tool for `go`.

### GB

[GB](https://getgb.io/) is a project based build tool for the Go programming language.

---

## Syntax

### Slice Capacity

By having the option to set the capacity of a new slice to be the same as the length, you can force the first append operation to detach the new slice from the underlying array. Detaching the new slice from its original source array makes it safe to change.

``` go
// Create a slice of strings.
// Contains a length and capacity of 5 elements.
source := []string{"Apple", "Orange", "Plum", "Banana", "Grape"}
// Slice the third element and restrict the capacity.
// Contains a length and capacity of 1 element.
slice := source[2:3:3]
// Append a new string to the slice.
slice = append(slice, "Kiwi")
```

Without this third index, appending Kiwi to our slice would’ve changed the value of Banana in index 3 of the underlying array, because all of the remaining capacity would still belong to the slice. But we restricted the capacity of the slice to 1. When we call `append` for the first time on the slice, it will create a new underlying array of two elements, copy the fruit Plum, add the new fruit Kiwi, and return a new slice that references this underlying array,

### append function

The built-in function `append` is also a __variadic__ function. This means you can pass multiple values to be appended in a single slice call. If you use the __...__ operator, you can append all the elements of one slice into another.

``` go
// Create two slices each initialized with two integers.
s1 := []int{1, 2}
s2 := []int{3, 4}
// Append the two slices together and display the results.
fmt.Printf("%v\n", append(s1, s2...))

Output:
[1 2 3 4]
```

---
