# text2table
BASH script to create HTML table from `|`-delimited data

I prefer to hand-code web pages in HTML, but the tables are a pain to encode.  I wrote this script as a quick 'n dirty way to quickly format a HTML table from `|`-delimited data -- followed by a bit of manual tweaking per desired effects.

See the script for details, comments -- e.g. formatting tips ...

```bash
[victoria@victoria ~]$ cat /tmp/table
<b>Year</b>|<b>Total Revenue</b>|<b>Total Expenses</b>|<b>Revenue-Expenses</b>|<b>Total Assets</b>|<b>Net Assets</b>
2017|$444.829|$320,108|$124,721|$255,786|$250,948
2016|$275,269|$206,717|$68,552|$127,074|$126,226
2015|$262,113|$360,003|$(97,890)|$58,934|$56,076
2014|$427,201|$376,932|$50,269|$159,850|$153,966
2013|$163,472|$58,875|$104,597|$111,872|$104,597

[victoria@victoria ~]$ ttt /tmp/table
Usage: /mnt/Vancouver/programming/scripts/text2table.sh input (file or dir)

[victoria@victoria ~]$ cat /tmp/table
<table style="table-layout:fixed; width:auto;">
	<thead><tr style="background:#b0c4de;"><td colspan="4"><b>This is the header and should span all columns.</b></td></tr></thead>
	<tfoot><tr><td colspan="4"><font size="-1">This is the footer and should span all columns.</font></td></tr></tfoot>
	<tr><td><b>Year</b></td><td><b>Total Revenue</b></td><td><b>Total Expenses</b></td><td><b>Revenue-Expenses</b></td><td><b>Total Assets</b></td><td><b>Net Assets</b></td>
	<tr><td>2017</td><td>$444.829</td><td>$320,108</td><td>$124,721</td><td>$255,786</td><td>$250,948</td>
	<tr><td>2016</td><td>$275,269</td><td>$206,717</td><td>$68,552</td><td>$127,074</td><td>$126,226</td>
	<tr><td>2015</td><td>$262,113</td><td>$360,003</td><td>$(97,890)</td><td>$58,934</td><td>$56,076</td>
	<tr><td>2014</td><td>$427,201</td><td>$376,932</td><td>$50,269</td><td>$159,850</td><td>$153,966</td>
	<tr><td>2013</td><td>$163,472</td><td>$58,875</td><td>$104,597</td><td>$111,872</td><td>$104,597</td>
	<tr><td>Net Assets = Total Assets minus Total Liabilities</td>
	</tbody>
</table>[victoria@victoria ~]$
```

**Formatted result** (I manually edited the header and footer):

![text2table-demo-output.png](https://buriedtruth.com/files/text2table-demo-output.png)
