#!/bin/bash

if [ "$1" == "" ]; then
    echo "The prep_gif.sh command must be followed by the file path to your GIF file."
    exit
fi

if [ -f $1 ]; then

    sourcefile=$1
    sourcename=$(basename -- "$sourcefile")
    sourcenamenoext="${sourcename%%.*}"
    targetdir="$(dirname -- "$1")/$sourcenamenoext/"
    targetfile="$(dirname -- "$1")/$sourcenamenoext/$sourcenamenoext.png"
    extension="${sourcefile##*.}"

    if [ "$extension" != "gif" ]; then
        echo "File must have the .gif extension."
        exit
    fi

    echo ""
    echo "Creating directory to host the PNG files..."
    mkdir -p $targetdir

    echo ""
    echo "Converting GIF to PNG..."
    magick $sourcefile -coalesce $targetfile

    echo ""
    count=$(find $targetdir/$sourcenamenoext-*.png -maxdepth 1 -type f|wc -l)
    let count=count-1
    echo "\usepackage{animate}"
    echo ""
    echo ""
    echo "\begin{center}"
    echo "\animategraphics[autoplay, loop, width=.7\linewidth]{25}{$targetdir$sourcenamenoext-}{0}{$count}"
    echo "\end{center}"

else
    echo "File $1 does not exist"
fi
