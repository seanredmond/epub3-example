MAKEFLAGS += --no-builtin-rules
.SUFFIXES:

.PHONY: check

EXCLPAT := -x \*~
EPUB := epub3byhand.epub

$(EPUB): mimetype META-INF/* EPUB/*
	rm $@ && zip -X $@ mimetype && zip -rg $@ META-INF $(EXCLPAT) && zip -rg $@ EPUB $(EXCLPAT)

epub: $(EPUB)

check:
	epubcheck $(EPUB)

