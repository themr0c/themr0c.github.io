#!/bin/sh
asciidoctor cv.adoc
asciidoctor-pdf -a pdf-stylesdir=resources/themes -a pdf-style=cv -a pdf-fontsdir=resources/fonts cv.adoc
