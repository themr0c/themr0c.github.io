## User Documentation Makefile

PROJECTNAME = ecriredeladoc
SOURCES = $(PROJECTNAME).txt
TARGETS = html/$(PROJECTNAME).html $(PROJECTNAME).pdf slides.html

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

#		   -a linkcss

## Generate PDF from docbook
DOCBOOK2PDF = dblatex -tpdf

SEE = see

all: $(TARGETS)

$(PROJECTNAME).pdf : $(PROJECTNAME).txt
	$(ASCIIDOC) --backend docbook $?
	$(DOCBOOK2PDF) $(PROJECTNAME).xml

html/$(PROJECTNAME).html : $(PROJECTNAME).txt
	mkdir -p html/graphs	
	$(ASCIIDOC) $(ASCIIDOCHTMLOPTS) --out-file $@ $?
	#cp -Rf style/html/* images html/
	cp -Rf style/html/* html/

slides.html : $(PROJECTNAME).txt
	$(ASCIIDOC)  -a theme=volnitsky --out-file slides.html --backend slidy $?

## WARNING: at cleanup, delete png files that were produced by output only !

clean : 
	rm -rf $(PROJECTNAME).xml *.pdf *.html *.png temp graphs html

view : all
	$(SEE) $(TARGETS)

