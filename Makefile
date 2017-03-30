## User Documentation Makefile

PROJECTNAME = ecriredeladoc
SOURCES = $(PROJECTNAME).asciidoc
TARGETS = slides/index.html html/$(PROJECTNAME).html $(PROJECTNAME).pdf 
## Asciidoc with general options
ASCIIDOC = asciidoc --doctype=book -a docinfo2 -a lang=fr

## Specific asciidoc options for XHTML output
ASCIIDOCHTMLOPTS = --backend xhtml11 \
		   -a stylesdir=$(CURDIR)/style/html \
		   -a theme=centsix \
		   -a numbered \
		   -a toc2 \
		   -a icons \
		   -a badges \
		   -a max-width=50em \
		   -a lang=fr \
		   -a toc-title="Ecrire de la Documentation" 

## Specific asciidoc options for XHTML slides output
ASCIIDOCSLIDESOPTS = --backend deckjs 

## Generate PDF from docbook
DOCBOOK2PDF = dblatex -tpdf

SEE = see

all: $(TARGETS)

$(PROJECTNAME).pdf : $(PROJECTNAME).asciidoc
	$(ASCIIDOC) --backend docbook $?
	$(DOCBOOK2PDF) $(PROJECTNAME).xml

html/$(PROJECTNAME).html : $(PROJECTNAME).asciidoc
	mkdir -p html/graphs	
	$(ASCIIDOC) $(ASCIIDOCHTMLOPTS) --out-file $@ $?
	cp -Rf style/html/* images html/

slides/index.html : $(PROJECTNAME).asciidoc
	mkdir -p slides
	$(ASCIIDOC)  $(ASCIIDOCSLIDESOPTS) --out-file slides/index.html  $?
	cp -Rf style/html/* images slides/

## WARNING: at cleanup, delete png files that were produced by output only !

clean : 
	rm -rf $(PROJECTNAME).xml *.pdf *.html *.png temp graphs html slides *.svg

view : all
	$(SEE) $(TARGETS)

