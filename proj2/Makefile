# makefile pro preklad LaTeX verze Bc. prace
# (c) 2008 Michal Bidlo
# E-mail: bidlom AT fit vutbr cz
# Upravil: Ladislav Sulak
#===========================================

NAME=projekt

all: $(NAME).pdf
	 okular projekt.pdf

pdf: $(NAME).pdf
	 okular projekt.pdf

$(NAME).ps: $(NAME).dvi
	%dvips $(NAME) >compilation.log

$(NAME).pdf: clean
	pdflatex $(NAME) >compilation.log
	bibtex $(NAME)   >compilation.log
	pdflatex $(NAME) >compilation.log
	pdflatex $(NAME) >compilation.log

$(NAME).dvi: $(NAME).tex $(NAME).bib
	latex $(NAME)  >compilation.log
	bibtex $(NAME) >compilation.log
	latex $(NAME)  >compilation.log
	latex $(NAME)  >compilation.log

clean:
	rm -f *.dvi *.log $(NAME).blg $(NAME).bbl $(NAME).toc *.aux $(NAME).out $(NAME).lof $(NAME).pdf
	rm -f $(NAME).tar.gz
	rm -f *~

pack: clean
	tar czvf $(NAME).tar.gz *.tex *.bib *.bst ./fig/* *.cls Makefile
