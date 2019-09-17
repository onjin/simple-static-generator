# Simple static page generator

[![Foo](https://img.shields.io/badge/license-New%20BSD-blue.svg)](https://github.com/onjin/simple-static-generator/blob/master/LICENSE)

**Free software: BSD license**

Generates single `index.html` from bunch of markdown files using [pandoc](https://pandoc.org) with table of contents.

Generated file is self contained so it includes required styles and scripts.


## Simple usage

Just clone repository, run `make watch` and `make serve`. Then just write new `content/001-first.md` file.
Make sure you have `pandoc` installed.


```
  $ git clone https://github.com/onjin/simple-static
  $ make build
  $ google-chrome index.html
```

## Configuration variables

 * TOC_DEPTH - default `2`
 * HIGHLIGH_STYLE - default `zenburn`

You can override variables by passing them in command line:

```
$ TOC_DEPTH=1 make build
```

or by writing them into `.env` file, for example:

```
TOC_DEPTH=3
HIGHLIGH_STYLE=kate
```


## Enhanced usage with watch build

To use watch you have install additional applications:

 * inotifywait - to observe file/directory changes - available in `inotify-tools`
 * python3 - to serve current directory through www server

```
  $ make watch
  $ make serve  # in another terminal/pane
  $ google-chrome http://localhost:8000/
```

## Example static page

In `examples` directory there is an index.html page generated from this `README.md` file:

 * [index.html](examples/index.html)
