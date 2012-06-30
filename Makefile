all ::

TEXBIN=/usr/texbin
PDFLATEX:=${TEXBIN}/xelatex

PATH:=${TEXBIN}:${PATH}
export PATH

TEXINPUTS:=.:tex:build:images:

export TEXINPUTS
export PDFLATEX

%.pdf :: %.tex
	texi2dvi -b -p --tidy --build-dir=build $< 

workshopForm.pdf :: workshopForm.tex build tex/workshopDetails.tex

Flyer.pdf :: Flyer.tex build tex/workshopDetails2.tex

build ::
	@test -d $@ || mkdir -p $@

SetList.pdf :: SetList.tex

Ad2012.pdf :: Ad2012.tex build

Ad2012-red.pdf :: Ad2012-red.tex build

all :: workshopForm.pdf  Flyer.pdf  SetList.pdf

all:: Ad2012.pdf Ad2012-red.pdf

Flyer2012.pdf :: Flyer2012.tex build tex/workshopDetails2.tex
	latex $<
	latex $<

all :: Flyer2012.pdf
