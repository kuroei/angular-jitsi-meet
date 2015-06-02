BUNDLE := angular-jitsi-meet.js

.PHONY: dist init clean test build browserify publish

dist: clean init test build browserify

init:
	npm install

clean:
	rm -rf dist/
	rm -rf lib/
	rm $(BUNDLE)

test:
	coffeelint src/**/*.coffee

build:
	coffee -o lib/ -c src/

browserify: build
	node_modules/.bin/browserify -e index.js -s APP -o ${BUNDLE}

publish: dist
	npm publish

