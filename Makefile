.PHONY: build help serve watch
.DEFAULT: help

# default configuration
TITLE ?= Simple Document
TOC_DEPTH ?= 2
HIGHLIGH_STYLE ?= zenburn
OUTPUT_FORMAT ?= html5
OUTPUT_PATH ?= output/index.html
PANDOC_OPTS ?=

# override configuration by optional .env file
-include .env
export $(shell sed 's/=.*//' .env)

help:
	@echo "Commands:"
	@echo
	@echo "  make build - build output from markdown files"
	@echo "  make watch - watch current dir and rebuild on changes (requires inotifywait)"
	@echo "  make serve - serve current directory at port :8000 (requires python3)"
	@echo


build:
	@echo "==> Building ${OUTPUT_PATH} in ${OUTPUT_FORMAT} format"
	@pandoc -s \
		--metadata title="${TITLE}" \
		--from=markdown-smart \
		--to=${OUTPUT_FORMAT} \
		--output ${OUTPUT_PATH} \
		--toc \
		--toc-depth ${TOC_DEPTH} \
		--css css/github.css \
		--highlight-style=${HIGHLIGH_STYLE} \
		--self-contained \
		${PANDOC_OPTS} \
		includes/intro.md \
		content/*md

watch:
	@echo "==> Watching $(pwd) for changes and rebuild"
	@while true; do \
			make build; \
			inotifywait -qre close_write .; \
			sleep 1; \
	done

serve:
	@python3 -m http.server
