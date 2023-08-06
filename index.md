# Introduction to Quantum Physics


TODO

*Introduction to Quantum Physics* gives you a compact introduction
to quantum mechanics.

It is very talkative because it's also the script for the videos. Things might change in future, so this will change.

The quizzes and exercises are an important part of learning quantum mechanics - do all!

:::{admonition} Learning goals

TODO


:::


## Prerequisites

We assume that you are familiar with the following topics:

- differential and integral calculus
- infinite series
- complex numbers and complex functions, at the level of [Chapter
  1](https://mathforquantum.quantumtinkerer.tudelft.nl/1_complex_numbers/)
  of the lecture notes also titled [Mathematics for Quantum
  Physics](https://mathforquantum.quantumtinkerer.tudelft.nl/)
- The course "Mathematics for Quantum Physics"

## Notational conventions

TODO


## Contributing

Please send us comments - TODO

## Acknowledgements

Griffiths

These notes were built using [Jupyter Book](https://jupyterbook.org/).
Parts of the technical “infrastructure” were adapted from the [Jupyter
Book demo](https://idemalab.tudelft.nl/jupyterbookdemo/) by Timon
Idema.

# how to build this book?

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
* Key documentation: https://jupyterbook.org/en/stable/content/references.html
* Debug python code: Remove `remove-output` if you want to see the error, but better use an ipynb to make plots then copy over the code.


# References

:::{bibliography}
:::
