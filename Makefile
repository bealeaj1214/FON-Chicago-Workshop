
TEXBIN=/usr/texbin
PDFLATEX:=${TEXBIN}/xelatex

PATH:=${TEXBIN}:${PATH}
export PATH

TEXINPUTS:=.:tex:build:images:

export TEXINPUTS
export PDFLATEX

%.pdf :: %.tex
	texi2dvi -b -p --tidy --build-dir=build $< 

workshopForm.pdf :: workshopForm.tex build

Flyer.pdf :: Flyer.tex build tex/workshopDetails2.tex

build ::
	@test -d $@ || mkdir -p $@