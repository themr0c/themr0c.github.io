#!/bin/bash
set -ex
cd `dirname "$0"`
asciidoctor-revealjs index.adoc
