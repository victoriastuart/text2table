#!/bin/bash
# vim: set filetype=sh :
# vim: syntax=sh autoindent tabstop=4 shiftwidth=4 expandtab softtabstop=4 textwidth=220
export LANG=C.UTF-8

#          file: /mnt/Vancouver/programming/scripts/text2table.sh
#       created: 2020-09-04
#       version: 02
# last modified: 2020-09-18 15:10:11 -0700 (PST)
# =============================================================================

## Remove old tmp file (if exists):
rm -f /tmp/t2t_table

## Create new file:
touch /tmp/t2t_table

## ~/bashrc aliases: ttt | t2t
#   alias t2t='/mnt/Vancouver/programming/scripts/text2table.sh'
#   alias ttt='/mnt/Vancouver/programming/scripts/text2table.sh'

## Usage: ttt <file>

printf 'Usage: /mnt/Vancouver/programming/scripts/text2table.sh input (file or dir)\n'


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

<<COMMENT
==============================================================================
text2table.sh
2020-09-04

<table style="table-layout:fixed; width:auto;">
<!-- Change width to 100% to be width of page [https://www.thesitewizard.com/css/make-table-cells-same-size.shtml]. -->

----------------------------------------
CELL ALIGNMENT
How to center align text in table cells in HTML?

  <td style="text-align:left|center|right">table cell</td>

e.g.

  <td style="text-align:center">MySQL</td>

https://www.tutorialspoint.com/How-to-center-align-text-in-table-cells-in-HTML
----------------------------------------

<!-- Title row, NICE background (light blue): -->
<tbody><tr style="background:#b0c4de;">

<table>
    <thead><tr><td colspan="5">This is the header and should span all columns.</td></tr></thead>
    <tfoot><tr><td colspan="5">This is the footer and should span all columns.</td></tr></tfoot>
    <tbody>
        <tr><td>11</td><td>12</td><td>13</td><td>14</td><td>15</td>
        <tr><td>21</td><td>22</td><td>23</td><td>24</td><td>25</td>
        <tr><td>31</td><td>32</td><td>33</td><td>34</td><td>35</td>
    </tbody>
</table>

<table>
  <tr>
    <td><b>Col 1 Header:</b></td>
    <td><b></center>Col 2 Header:<sup><b><font color=red>*</font></b></sup></b></td>
  </tr>
  <tr>
    <td><code><font size="2">Row 1 Col 1</font></code></td>
    <td><code><font size="2">Row 1 Col 2</font></code></td>
    <td><code><font size="2">Row 1 Col 3</font></code></td>
  </tr>
  <tr>
    <td><code><font size="2">Row 2 Col 1</font></code></td>
    <td><code><font size="2">Row 2 Col 2</font></code></td>
    <td><code><font size="2">Row 2 Col 3</font></code></td>
  </tr>
  <tr>
    <td><code><font size="2">Row 3 Col 1</font></code></td>
    <td><code><font size="2">Row 3 Col 2</font></code></td>
    <td><code><font size="2">Row 3 Col 3</font></code></td>
  </tr>
    <td colspan=2><sup><b><font color=red>*</font></b></sup><code><font size="2">col span - footnote -  line 1<br>&nbsp;col span - footnote -  line 2</font></code></td>
  <tr>
  </tr>
</table>
==============================================================================
COMMENT

