NAME = novel
PANDOC = pandoc -s --number-sections

PDF = $(NAME).pdf

SRC = metadata.yml \
      after_main_title.md \
      dedication.md \
      before_chapters.md \
      $(sort $(wildcard chapters/*.md))

all: $(PDF)

$(PDF): $(SRC)
	$(PANDOC) \
		-V geometry:paperwidth=11cm \
		-V geometry:paperheight=18cm \
		-V documentclass=memoir \
		-V header-includes="\\usepackage{caption}\\captionsetup{labelformat=empty}\\setstocksize{11cm}{18cm}" \
		$(SRC) -o $@

