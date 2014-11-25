.PHONY: all build-ml build-tex clean clean-ml clean-tex

all: build-tex

build-ml:
	ocamlbuild -j 0 -use-ocamlfind example_cppo.native example_bitstring.native example_lwt.native

build-tex:
	latexmk -outdir=_build -pdf -xelatex -use-make slides.tex

clean: clean-tex clean-ml

clean-tex:
	latexmk -outdir=_build -CA

clean-ml:
	ocamlbuild -clean
