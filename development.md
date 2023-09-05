# Development notes

## video lectures

### idea
* the script/book contains everything - text close to what said in video, and equations and plots needed for slides.
* make slides before video, making slides checks the storyline.
* record video based on script, and put video of me on the slides and record slideshow and combine into final video.

### record video 
* use macbook pro on eye height, bluetooth mouse to scroll (read from top of screen). best greenscreen but not needed
* macbook pro m1 microphones & camera is sufficient at 1-2m distance
* make sure the audio is strong enough (system prefs)

#### DONT FORGET
* make introduction, "in this video..."
* never say left/right figure, on slides it's different.

### overlay video with OBS
https://obsproject.com/

Powerpoint: 
* preferences, slideshow -> disable navigation things, use right-click instead
* present normally (in-window has no presenter view). right-click -> "use presenter view" even without 2nd screen, slideshow is on hidden window.

Now in OBS: 
* settings -> video
  * video base: 1920x1080 (16:9) since slides are in 16:9
  * output: select mp4 format...
* DnD video of me to sources
    opt+cmd -> crop, resize, move to correct position
* video -> filters
  * either clever background removal [install this](https://github.com/royshil/obs-backgroundremoval)
  * or with green screen: chroma key, works out of the box.
* audio settings:
    * video: enable "monitor and output", also amplify if needed (upper end of green)
    * disable audio recording/output for screen capture & mic (click speaker->red)
* add source: macos window capture -> powerpoint  presentation, resize and order to background
    * decide if capture cursor or not.
    * filters -> crop/pad, top/bottom 90/90 (from macbook screen to 16:9)
* start recording, restart video playback (bug that needed?), switch to powerpoint presenter view, click through...


### cut final video
e.g. with kdenlive https://kdenlive.org/ :
* drop file on track. 
* cut https://userbase.kde.org/Kdenlive/Manual/Timeline/Editing
* remove free space before/after (right click)
* switch on video and audio green lights at left
* project->render, render to file


## the iqp-book

It is made using [Jupyter Book](https://jupyterbook.org/). I wonder if not everything would be easier with the several decades old [texmacs](https://www.texmacs.org/)...

### install stuff in addition to anaconda
conda install is heavily broken, use pip!
```
pip install -U jupyter-book
pip install -U sphinx-proof
pip install -U sphinx-exercise
pip install -U sphinx-autobuild
```
### build and develop

The book sourcecode is in this folder, go into it.

This will use  `_config.yml` and  `_toc.yml` to generate conf.py:

```
jupyter-book config sphinx .
```
This makes the book in html and opens it:
```
sphinx-build -j auto . ./_build/html -b html
open ./_build/html/index.html
```
This auto-builds:
```
sphinx-autobuild -j auto . ./_build/html
```


### important notes
* The best editor with preview seems to be [vscode + myst plugin](https://github.com/executablebooks/myst-vs-code). 
  * It's not very complete, best auto-build.
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
* Pictures are either made with inline matplotlib or [IPE](https://github.com/otfried/ipe) (zoom in to export PNG high-res)!

