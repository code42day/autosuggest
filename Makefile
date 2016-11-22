all: lint compile

node_modules:
	npm install && touch $@

lint:
	@jshint index.js

compile: node_modules index.js
	@mkdir -p build
	@browserify \
		--require ./index.js:autosuggest \
		--outfile build/build.js

clean:
	rm -fr build components template.js

.PHONY: clean compile
