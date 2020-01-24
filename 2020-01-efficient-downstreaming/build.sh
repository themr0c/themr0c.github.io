#!/bin/bash
set -ex
cd `dirname "$0"`
bundle exec asciidoctor-revealjs index.adoc
