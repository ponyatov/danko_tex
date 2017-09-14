TEX = danko.tex header.tex
TEX += part_1/part_1.tex
TEX += part_1/chap_1/chap_1.tex part_1/chap_1/1_1_1.tex

LATEX = pdflatex -halt-on-error
danko.pdf: $(TEX)
	$(LATEX) $< && $(LATEX) $< 