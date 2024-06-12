# Compilers
TEX = latexmk -lualatex="lualatex -shell-escape" -lualatex

# Documents
POSTER = poster.pdf

FIGURES_DIR = figures
FIGURES_SRC = $(wildcard $(FIGURES_DIR)/*.tex)
FIGURES = $(patsubst $(FIGURES_DIR)/%.tex,%.pdf,$(FIGURES_SRC))

# Make everything
.PHONY: all
all: $(POSTER)

# Make figures
.PHONY: figures
figures: $(FIGURES)

# Remove PDFs
.PHONY: clean
clean:
	-rm ./*.pdf 2>/dev/null || true

$(POSTER): %.pdf: $(FIGURES) %.tex
	$(TEX) $*

$(FIGURES): %.pdf: $(FIGURES_DIR)/%.tex
	$(TEX) $(FIGURES_DIR)/$*
