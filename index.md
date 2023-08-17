# Introduction

*Introduction to Quantum Physics* gives you a compact introduction to quantum mechanics, intended as part of the homologation module of the Leiden/Delft MSc programme Quantum Information Science and Technology QIST.

The script here is very talkative because it's also the script for the videos. The teaching method might change in future, so this might change, too.

To gain most from this course, do the brightspace quizzes, exercise assignments (do it yourselves or in a group!), collect questions for the workgroup sessions, and read a bit in Griffith.

<!-- make deeper but https://github.com/executablebooks/jupyter-book/issues/1131 -->
```{tableofcontents}
```

## Prerequisites

We assume that you are familiar with:

- Differential and integral calculus
- Infinite series
- Complex numbers and complex functions
- The course [Mathematics for Quantum Physics](https://pub.math.leidenuniv.nl/~bruinpj/MQP/)

## Notational conventions

* We often leave out the arrow on top of vectors. Which variable is a vector or a scalar should be clear from the context.
* We also often leave out the hat on operators - the same applies, if one gets used to it there is no ambiguity.

## What is missing?

* Magnetic resonance, only basics.
* The variational principle (Griffith 8)
* Molecules
* Scattering theory (Griffith 10)
* Large parts of quantum electrodynamics, for instance the [Aharonov–Bohm effect](https://en.wikipedia.org/wiki/Aharonov%E2%80%93Bohm_effect).
* Fermi’s Golden Rule (G11.3)
* Stimulated and spontaneous emission, absorption

## Comments and contributing

Please send comments, it seems there is also some button on the pages but I don't know this yet.

## Acknowledgements

Large parts are based on the excellent book by **Griffiths, Introduction to Quantum Mechanics**, third edition. Small parts on **Phillips, Introduction to quantum mechanics**.

These notes were made using [Jupyter Book](https://jupyterbook.org/), based on Peter Bruin's script for [Mathematics for Quantum Physics](https://pub.math.leidenuniv.nl/~bruinpj/MQP/) which in turn is partially based on the [Jupyter
Book demo](https://idemalab.tudelft.nl/jupyterbookdemo/) by Timon
Idema.

# Development notes

````{toggle}
:show:

## install stuff in addition to anaconda
conda install is heavily broken, use pip!
```
pip install -U jupyter-book
pip install -U sphinx-proof
pip install -U sphinx-exercise
pip install -U sphinx-autobuild
```
## build and develop

The book sourcecode is in this folder, go into it.

This will use  `_config.yml` and  `_toc.yml` to generate conf.py:

```
jupyter-book config sphinx .
```
This makes the book in html and opens it:
```
sphinx-build . ./_build/html -b html
open ./_build/html/index.html
```


## important notes
* The best editor with preview seems to be [vscode + myst plugin](https://github.com/executablebooks/myst-vs-code). 
  * But it's not very complete, best run in background `sphinx-autobuild . ./_build/html` and open the URL in a browser.
  * Typora is better for undistracted writing.
* Buy https://snip.mathpix.com/ for typesetting equations from screenshots and handwritten images.
* Syntax is very fragile - always have new lines before and after equations.
* Key documentation: [jupyter book](https://jupyterbook.org/en/stable/content/references.html), [cheat sheet](https://jupyterbook.org/en/stable/reference/cheatsheet.html)
  * ```$$ \Psi $$(my_label) -> {eq}`my_label` ```
  * figure: use long form to have caption.
  * note: `:::{note}` close with `:::`
  * similar things: 
    * comment at right side: `{margin}`
    * tip: `:::{tip}`
* Debug python code: Remove `remove-output` if you want to see the error, but better use an ipynb to make plots then copy over the code.
* Pictures are either made with inline matplotlib, and https://github.com/otfried/ipe (zoom in to export PNG high-res)!



````
