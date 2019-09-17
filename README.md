# Simple static page generator

[![Foo](https://img.shields.io/badge/license-New%20BSD-blue.svg)](https://github.com/onjin/simple-static-generator/blob/master/LICENSE)

**Free software: BSD license**

Generates single `index.html` from bunch of markdown files using [pandoc](https://pandoc.org) with table of contents.

Generated file is self contained so it includes required styles and scripts.
You can use any pandoc output format like:

 * jupyter notebook (ipynb)
 * pdf
 * wiki
 * Jira

 and many others. Check [https://pandoc.org/index.html](https://pandoc.org/index.html) for available formats.



## Simple usage

Just clone repository, run `make watch` and `make serve`. Then just write new `content/001-first.md` file.
Make sure you have `pandoc` installed.


```
  $ git clone https://github.com/onjin/simple-static
  $ make build
  $ google-chrome output/index.html
```

## Configuration variables

 * TITLE - default `Simple Document` - document title
 * TOC_DEPTH - default `2`
 * HIGHLIGH_STYLE - default `zenburn`
 * OUTPUT_FORMAT - default `html5`
 * OUTPUT_PATH - default `output/index.html
 * PANDOC_OPTS - optional additional pandoc parameters

You can override variables by passing them in command line:

```
$ TOC_DEPTH=1 make build
$ TOC_DEPTH=2 OUTPUT_FORMAT=pdf OUTPUT_PATH=output/index.pdf  PANDOC_OPTS="-t latex" make build
$ OUTPUT_FORMAT=ipynb OUTPUT_PATH=output/notebook.ipynb make build
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
  $ google-chrome http://localhost:8000/output/index.html
```

## Example static page

In `examples` directore there are documents generated from this README.md file:

 * [index.html](http://htmlpreview.github.io/?https://github.com/onjin/simple-static-generator/blob/master/examples/index.html)
 * [index.pdf](https://github.com/onjin/simple-static-generator/blob/master/examples/index.pdf)
 * [index.ipynb](https://github.com/onjin/simple-static-generator/blob/master/examples/index.ipynb)
