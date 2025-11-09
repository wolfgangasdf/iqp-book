---
kernelspec:
    display_name: Python 3
    language: python
    name: python3
authors:
  - name: ''
---


# Development notes

## video lectures

### idea
* the script/book contains everything - text close to what said in video, and equations and plots needed for slides
* make slides before video, making slides checks the storyline
* record video based on script, and put video of me on the slides and record slideshow and combine into final video

### record video 
* use macbook pro on eye height, bluetooth mouse to scroll (read from top of screen). best greenscreen but not needed
* macbook pro m1 microphones & camera is sufficient at 1-2m distance
* make sure the audio is strong enough (system prefs)
* with quicktime: float on top, check 3x that recording in progress, it's super confusing

**Don't forget**
* show slidetags before
* make introduction, "in this video..."
* never say left/right figure, on slides it's different

### overlay video with OBS
https://obsproject.com/

Powerpoint: 
* preferences, slideshow -> disable navigation things, use right-click instead
* present normally (in-window has no presenter view). right-click -> "use presenter view" even without 2nd screen, the slideshow is on the hidden window

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

It is made using [Jupyter Book](https://jupyterbook.org/), now version 2.0.

Bugs:
* Numbering of equations etc, should be chapter-wise
* The table of contents on the left should be expanded
* code-cell output should be centered
* Overview chapter should have no number
* Latex numbering wrong


### install in addition to anaconda
```
pip install -U jupyter-book
pip install -U mystmd
```

### build and develop

Go into the book sourcecode folder.

Settings are in `myst.yml`.

```
# This builds the website:
jupyter book build --execute

#This auto-builds:
jupyter book start --execute

#This makes a website:
export BASE_URL="/yourbaseurl"
jupyter book build --execute --html

#This makes a PDF:
jupyter book build --execute --pdf

#This cleans up, to rebuild:
rm -r _build
```

### notes
* The best editor with preview seems to be [vscode + myst plugin](https://github.com/executablebooks/myst-vs-code). 
  * It's not very complete, best auto-build.
  * Typora is better for undistracted writing.
* Buy https://snip.mathpix.com/ for typesetting equations from screenshots and handwritten images.
* Syntax is very fragile - always have new lines before and after equations.
* Key documentation: [jupyter book](https://jupyterbook.org), [Myst MD](https://mystmd.org/guide)
* Pictures are either made with inline matplotlib or [IPE](https://github.com/otfried/ipe) (zoom in to export PNG high-res)!
