#!/bin/bash

bundle config --local github.https true
bundle --path=.bundle/gems --binstubs=.bundle/.bin
git clone -b 3.7.0 --depth 1 https://github.com/hakimel/reveal.js.git
npm install highlight.js
