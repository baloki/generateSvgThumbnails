# Generating SVG Thumbnails Utility
This tool is based on a [Codepen](https://codepen.io/ainalem/details/aLKxjm) I saw by [Mikael Ainalem](https://twitter.com/mikaelainalem) where he used two tone SVG versions of images to create the placeholder images for a lazy loading solution.

After a bit of reading I found [a handy guide on how to do this via php](https://ctf0.wordpress.com/2017/10/18/optimize-image-loading-by-using-svg-datauri-or-both/) which I've adapted into a shell that can be used to generate web friendly images and SVG thumbnails.

## Requirements
* ImageMagick (http://imagemagick.org)
* potrace (http://potrace.sourceforge.net)
* svgo (https://github.com/svg/svgo)

## Setup
* Install all of the above required packages.
* Clone this repo
* Set the correct permissions to allow the bash script to run (e.g. `chmod u+x generateSvgThumbnails.command`

## To Use
Simply insert the jpg files you want to convert into the input folder, open a terminal, navigating to the root folder of this project and then run the bash script (`./generateSvgThumbnails.command`).
