.PHONY: build help serve watch
.DEFAULT: help

# default configuration
TOC_DEPTH ?= 2
HIGHLIGH_STYLE ?= zenburn

# override configuration by optional .env file
-include .env
export $(shell sed 's/=.*//' .env)

help:
	@echo "Commands:"
	@echo
	@echo "  make build - build index.html from markdown files"
	@echo "  make watch - watch current dir and rebuild on changes (requires inotifywait)"
	@echo "  make serve - serve current directory at port :8000 (requires python3)"
	@echo


build:
	@echo "==> Building index.html"
	@pandoc -s \
		--from=markdown \
		--to=html5 \
		--output index.html \
		--toc \
		--toc-depth ${TOC_DEPTH} \
		--css css/github.css \
		--highlight-style=${HIGHLIGH_STYLE} \
		--self-contained \
		--smart \
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
