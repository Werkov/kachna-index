## Kachní rejstřík

Very rudimentary version hacked at 1 AM.

### Usage

    $ # modify N and COLS i partition.sh
    $ ./partition.sh index.csv > index.tex
    $ xelatex list.tex


### Known bugs

For loop in `partition.sh` has fixed bounds so index may be either incomplete
or repeated at the end.
