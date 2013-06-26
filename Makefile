all ::

TEXBIN=/usr/texbin
PDFLATEX:=${TEXBIN}/xelatex

PATH:=${TEXBIN}:${PATH}
export PATH

TEXINPUTS:=.:tex:build:images:

export TEXINPUTS
export PDFLATEX

%.pdf :: %.tex
	latexmk -f -xelatex -outdir=build -auxdir=build $<
	cp build/$(@F) $@


workshopForm.pdf :: workshopForm.tex build tex/workshopDetails.tex

Flyer.pdf :: Flyer.tex build tex/workshopDetails2.tex

build ::
	@test -d $@ || mkdir -p $@

SetList.pdf :: SetList.tex

Ad2012.pdf :: Ad2012.tex build

Ad2012-red.pdf :: Ad2012-red.tex build

all :: workshopForm.pdf  Flyer.pdf  SetList.pdf

all:: Ad2012.pdf Ad2012-red.pdf

Poster2012.pdf :: Poster2012.tex build

all:: Poster2012.pdf

Flyer2012.pdf :: Flyer2012.tex build tex/workshopDetails2.tex
	pdflatex $<
	pdflatex $<

all :: Flyer2012.pdf

Brochure2012.pdf :: Brochure2012.tex  tex/workshopDetails2.tex
	latexmk -f -pdf -outdir=build -auxdir=build $<
	cp build/$(@F) $@

all :: Brochure2012.pdf

Flyer2013.pdf :: Flyer2013.tex build tex/workshopDetails2_2013.tex
	latexmk -f -pdf -outdir=build -auxdir=build $<
	cp build/$(@F) $@

all :: Flyer2013.pdf

Brochure2013.pdf :: Brochure2013.tex  tex/workshopDetails2_2013.tex tex/registrationForm2013.tex
	latexmk -f -pdf -outdir=build -auxdir=build $<
	cp build/$(@F) $@


all :: Brochure2013.pdf

Registration2013.pdf :: Registration2013.tex   tex/registrationForm2013.tex
	latexmk -f -pdf -outdir=build -auxdir=build $<
	cp build/$(@F) $@


all :: Registration2013.pdf


Ad2013.pdf :: Ad2013.tex build tex/Ad2013-body.tex
	latexmk -f -xelatex -outdir=build -auxdir=build $<
	cp build/$(@F) $@

all:: Ad2013.pdf
