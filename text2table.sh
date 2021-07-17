#!/bin/bash
# vim: set filetype=sh :
# vim: syntax=sh autoindent tabstop=4 shiftwidth=4 expandtab softtabstop=4 textwidth=220
export LANG=C.UTF-8

#          file: text2table.sh
#       created: 2020-09-04
#       version: 03
# last modified: 2021-07-16
# =============================================================================

## Remove old tmp file (if exists):
rm -f /tmp/t2t_table

## Create new file:
touch /tmp/t2t_table

## ~/bashrc aliases: ttt | t2t
#   alias t2t='/mnt/Vancouver/programming/scripts/text2table.sh'
#   alias ttt='/mnt/Vancouver/programming/scripts/text2table.sh'

## Usage: ttt <file>

printf 'Usage: ttt <file name>\n'

# ----------------------------------------------------------------------------
## Process |-delimited input file

sed -i 's/|/<\/td><td>/g' $1
sed -i 's/^/\t\t<tr><td>/g' $1
sed -i 's/$/<\/td><\/tr>\n/g' $1

# ----------------------------------------------------------------------------
## TABLE HEADERS, FOOTERS:

printf '\t</tbody>\n</table>' >> $1

sed -i '1s/^/\n\t<tbody>\n\n/' $1

sed -i '1s/^/\n\t<tfoot><tr><td colspan="4">This is the footer and should span all columns.<\/td><\/tr><\/tfoot>\n/' $1

sed -i '1s/^/\n\t<thead><tr style="background:#b0c4de;"><td colspan="4"><b>This is the header and should span all columns.<\/b><\/td><\/tr><\/thead>\n/' $1

sed -i '1s/^/<table style="table-layout:fixed; width:auto;">\n/' $1

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
