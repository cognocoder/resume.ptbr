
SRC = main
LTX = latexmk
PDF = okular

LTX_FLAGS = -pdf -synctex=1 -interaction=nonstopmode -halt-on-error

.PHONY: all clean run

all: $(SRC).pdf

$(SRC).pdf: $(SRC).tex
	@$(LTX) $(LTX_FLAGS) $(SRC).tex
	@touch $(SRC).pdf

clean:
	@rm -rf *.aux *.fdb_latexmk *.fls *.log *.out *.synctex.gz $(SRC).pdf

run: $(SRC).pdf
	@$(PDF) $(SRC).pdf 1>&- 2>&- &

