# gifsinbeamer: A quick and dangerously sparse tutorial for putting gifs in your Beamer presentations.

This README should allow you to embed GIFs in beamer slides quickly. To learn more about the process and configuration options, see the `gifsinbeamer.pdf` file. 

# Why? How?

The PDF format doesn't support GIFs, and its handling of video is pretty bad in general. To circumvent these problems, we are going to:

1. Convert a GIF to a series of PNG files using the ImageMagick program.
2. Use the `animate` LaTeX package to embed those images in our beamer slides.

The resulting PDF should show moving GIFs, but *only* in some viewers, such as Adobe Acrobat Reader. Other viewers such as Foxit or OSX Preview do not appear to support animations.

# Requirements

You need three things to embed GIFs in beamer slides:

1. A full LaTeX distribution which includes the `animate` package.
2. ImageMagick
3. A PDF reader which supports animations (e.g., Adobe Acrobat Reader)

Here are some instructions to install ImageMagick on OSX and Windows

#### OSX

The simplest way to install ImageMagick on OSX is to use the Homebrew package manager. If you don't already use Homebrew, install it by following the instructions on this website: 

https://brew.sh/

Once Homebrew is installed, open the Terminal and execute these lines of code:

```bash
brew update && brew upgrade
brew install imagemagick
```

If you already have Imagemagick and Homebrew, you may want to update: 

```bash
brew reinstall imagemagick
```

You're ready!

#### Windows

Good luck!

# Usage

### OSX

#### Step 1

Download the file called `prep_gif.sh` from the Github respository to the directory where your slides are saved.

#### Step 2

Open a Terminal, move to the directory where your slides are saved, and make the script executable. For example:

```bash
cd ~/Desktop/slides
chmod u+x prep_gif.sh
```

#### Step 3

Execute the script by pointing it to the GIF you want to use:

```bash
./pref_gif.sh figures/cat.gif
```

This will create a new folder called `figures/cat/` where a series of PNG files will be saved.

#### Step 4

Copy this line in the preamble of your LaTeX document:

```latex
\usepackage{animate}
```

If you are using `RMarkdown` instead of LaTeX, you can include this in the YAML header of your document:

```latex
header-includes:
   - \usepackage{animate}
```

Copy the LaTeX code that the script echoed in the terminal into your document. This code should look a little bit like this:

```latex
\animategraphics[autoplay, loop, width=.7\linewidth]{25}{figures/cat/cat-}{0}{36}
```

In the code above, the number 36 refers to the number of frames in your GIF. You can find that number by counting the number of PNG files produced by ImageMagick when you converted the GIF.

#### Step 5

Compile your LaTeX document.

#### What if this doesn't work?

If the `gif_prep.sh` script does not work for you, you may want to convert your GIF manually. From the Terminal, this would entail writing code that looks like this:

```bash
magick "figures/cat.gif" -coalesce "figures/cat/cat.png"
```

Then, you'll want to follow Step 4 of the previous section to include the GIF in your LaTeX document.

If your images are not moving, try reading your PDF in Adobe Acrobat Reader.

### Linux

Follow the same steps as on OSX, but the command should be:

```bash
mkdir -p figures/cat
convert "figures/cat.gif" -coalesce "figures/cat/cat.png"
```

You can edit a single line of the `prep_gif.sh` file to change "magick" to "convert" and the script should work.

### Windows

We do not currently offer a script to automatically prepare the files for you. Instead, you will need to execute the commands yourself from the terminal:

```bash
mkdir gifoutput
magick "cat.gif" -coalesce "cat\cat.png"
```

Then, copy this line in the preamble of your LaTeX document:

```latex
\usepackage{animate}
```

Add the `animategraphics` command to your `.tex` document. This command should look a little bit like this:

```latex
\animategraphics[autoplay, loop, width=.7\linewidth]{25}{figures/cat/cat-}{0}{36}
```

In the code above, the number 36 refers to the number of frames in your GIF. You can find that number by counting the number of PNG files produced by ImageMagick when you converted the GIF.

Finally, compile your LaTeX document.
