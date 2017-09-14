TEX = danko.tex book.tex header.tex
TEX += part_1/part_1.tex
TEX += part_1/chap_1/chap_1.tex part_1/chap_1/1_1_1.tex

SRC = book.cql part_1/chap_1/1_1_1.cql

FIG = book.png part_1/chap_1/1_1_1.pdf

LATEX = pdflatex -halt-on-error
danko.pdf: $(TEX) $(SRC) $(FIG)
	$(LATEX) $< && $(LATEX) $< 
	
%.pdf: %.dot
	dot -Tpdf -o $@ $<
%.png: %.dot
	dot -Tpng -o $@ $<
	