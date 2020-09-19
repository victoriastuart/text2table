#!/bin/bash
# vim: set filetype=sh :
# vim: syntax=sh autoindent tabstop=4 shiftwidth=4 expandtab softtabstop=4 textwidth=220
export LANG=C.UTF-8

#          file: /mnt/Vancouver/programming/scripts/text2table.sh
#       created: 2020-09-04
#       version: 02
# last modified: 2020-09-19 00:18:26 -0700 (PST)
# =============================================================================

## Remove old tmp file (if exists):
rm -f /tmp/t2t_table

## Create new file:
touch /tmp/t2t_table

## ~/bashrc aliases: ttt | t2t
#   alias t2t='/mnt/Vancouver/programming/scripts/text2table.sh'
#   alias ttt='/mnt/Vancouver/programming/scripts/text2table.sh'

## Usage: ttt <file>

# printf 'Usage (example): /mnt/Vancouver/programming/scripts/text2table.sh /tmp/table\n'
printf 'Usage: ttt <file name>\n'

# ----------------------------------------------------------------------------
## Process |-delimited input file

sed -i 's/|/<\/td><td>/g' $1
sed -i 's/^/\t<tr><td>/g' $1
sed -i 's/$/<\/td>/g' $1

# ----------------------------------------------------------------------------
## TABLE HEADERS, FOOTERS:

## Do this first; add blank line, or sed 1s will overwrite first line
# printf '\n\t</tbody>\n</table>\n' >> /tmp/t2t_table

printf '\t</tbody>\n</table>' >> $1

## https://stackoverflow.com/questions/9533679/how-to-insert-a-text-at-the-beginning-of-a-file
## sed won't work on empty file, so do the printf command (above), first.

# sed -i '1s/^/<table">\n/' /tmp/t2t_table
# sed -i '2s/^/\t<thead><tr><td colspan="4">This is the header and should span all columns.<\/td><\/tr><\/thead>\n/' /tmp/t2t_table
# sed -i '3s/^/\t<tfoot><tr><td colspan="4">This is the footer and should span all columns.<\/td><\/tr><\/thead>\n/' /tmp/t2t_table
# cat /tmp/t2t_table

sed -i '1s/^/<table style="table-layout:fixed; width:auto;">\n/' $1
sed -i '2s/^/\t<thead><tr style="background:#b0c4de;"><td colspan="4"><b>This is the header and should span all columns.<\/b><\/td><\/tr><\/thead>\n/' $1
sed -i '3s/^/\t<tfoot><tr><td colspan="4"><font size="-1">This is the footer and should span all columns.<\/font><\/td><\/tr><\/tfoot>\n/' $1
# echo 'Done!'

echo

# ----------------------------------------------------------------------------
<<COMMENT

<table style="table-layout:fixed; width:auto;">
<!-- Change width to 100% to be width of page [https://www.thesitewizard.com/css/make-table-cells-same-size.shtml]. -->

----------------------------------------
Cell alignment: aligning text in table cells
https://www.tutorialspoint.com/How-to-center-align-text-in-table-cells-in-HTML

  <td style="text-align:left|center|right">table cell</td>

e.g.

  <td style="text-align:center">Apples</td>

----------------------------------------
<!-- Title row with light blue (Wikipedia) background: -->

<tbody><tr style="background:#b0c4de;">

COMMENT
# ----------------------------------------------------------------------------
