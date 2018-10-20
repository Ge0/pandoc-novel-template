NAME = novel
PANDOC = pandoc -s --number-sections

PDF = $(NAME).pdf

SRC = metadata.yml $(sort $(wildcard chapters/*.md))

all: $(PDF)

$(PDF): $(SRC)
	$(PANDOC) \
		-V geometry:paperwidth=5in \
		-V geometry:paperheight=8in \
		-V documentclass=memoir \
		-V header-includes="\\usepackage{caption}\\captionsetup{labelformat=empty}\\setstocksize{8in}{5in}" \
		$(SRC) -o $@

