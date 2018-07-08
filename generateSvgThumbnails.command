#!/bin/bash
echo 'Creating Temporary Directory...'
mkdir ./processing
echo 'Complete'
echo 'Removing all existing Output Files...'
rm ./output/*
mkdir ./output/thumbnails
echo 'Complete'
FILES=./input/*.jpg
echo "Starting Generation for $FILES"
for f in $FILES
do
    FULL_FILENAME=$f
    FILENAME=${FULL_FILENAME##*/}
    NOEXTENSION_FILENAME=${FILENAME%%.*}
    THUMBNAIL_FILENAME="output/thumbnails/$NOEXTENSION_FILENAME.svg"
    echo "Generating Websafe Image for $FULL_FILENAME..."
    convert "$FULL_FILENAME" -resize 1024 "output/$NOEXTENSION_FILENAME.jpg"
    echo "Generating Websafe Thumbnail for $FULL_FILENAME..."
    convert "$FULL_FILENAME" -resize 300 "output/thumbnails/$NOEXTENSION_FILENAME.jpg"
    echo "Generating SVG Thumbnail for $FULL_FILENAME..."
    convert "$FULL_FILENAME" -resize 300 "processing/$NOEXTENSION_FILENAME.ppm"
    potrace "processing/${FILENAME%%.*}.ppm" -s -o $THUMBNAIL_FILENAME --color=#cccccc --flat --unit=1 --turdsize=40 --opttolerance=0.4 --turnpolicy=minority
    echo "Optimising SVG Thumbnail for $FULL_FILENAME..."
    svgo $THUMBNAIL_FILENAME -o $THUMBNAIL_FILENAME
done
echo 'Tidying up...'
rm -rf processing
echo 'Job Complete!'
