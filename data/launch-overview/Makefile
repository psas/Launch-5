NOTEBOOKS=$(wildcard *.ipynb)
NBLATEX=$(NOTEBOOKS:.ipynb=.tex)
NBMARKDOWN=$(NOTEBOOKS:.ipynb=.md)

PDF=introduction.markdown IMU.md

LATEXARGS = --standalone \
            --table-of-contents \
            --chapters \
            --metadata=title:"Launch 5 Data Overview" \
            --metadata=author:"Portland State Aerospace Society" \
            --metadata=date:"January 01, 2016"

all: PSAS-launch-5-overview.pdf

PSAS-launch-5-overview.pdf: $(PDF)
	pandoc $(LATEXARGS) $(PDF) -f markdown -o PSAS-launch-5-overview.pdf

%.tex: %.ipynb
	ipython nbconvert --execute --config formatting/ipython_convert.py --to=latex $^

%.md: %.ipynb
	ipython nbconvert --execute --to=markdown --template="doc-format/nb-markdown.tpl" $^

clean:
	rm -f $(NBMARKDOWN)
	rm -f PSAS-launch-5-overview.pdf
