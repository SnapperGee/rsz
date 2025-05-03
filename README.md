# RSZ

Bash script to resize the terminal window from the command line.

## Usage

The simplest most minimal way to use this script is to pass the desired width
(number of columns) you want the terminal window to be followed optionally by
the desired height (number of rows) you want the terminal window to be.

```bash
rsz width [height]
rsz 80 # resizes terminal window to 80 columns
rsz 80 120 # resizes terminal window to 80 columns and 120 rows
```

There's also predefined width and height dimensions that can easily be set to
via:

```bash
rsz sm|md|lg
rsz md # sets terminal window to 90x20. 90 columns width by 20 rows height.
```

Explicitly setting width (columns) and height (rows) is also possible:

```bash
rsz w|width|h|height
rsz w 80 # resizes terminal window to 50 columns. Identical to rsz 50 and rsz width 50
rsz h 120 # resizes terminal window to 120 rows. Identical to rsz height 120
```

The width and height can also be adjusted relative to its current size:

```bash
rsz w+|width+|h+|height+
rsz w-|width-|h-|height-
rsz w+ 10 # increases current width by 10 columns
rsz h- 10 # reduces current height by 10 rows
```

The help text can be displayed:

```bash
rsz -h|--help
```

The version of the currently installed script can be displayed:

```bash
rsz -v
```
