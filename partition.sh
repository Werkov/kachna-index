#!/bin/bash

if [ "x$1" = "x" ] ; then
	echo "Usage: $0 index.csv >index.tex"
	exit
fi

IN=$1
OUT=out.tex

N=34
#N=68
COLS=4


split -l $N -d -a 4 $IN

mask=""
for i in `seq $COLS` ; do
	mask="ll$mask"
done

echo >$OUT
cat >>$OUT <<EOD
\begin{tabular}{$mask}
EOD

for i in `seq 0 10` ; do
	from=$(($i * $COLS))
	to=$(( ($i+1) * $COLS - 1))

	from=`printf "%04d" $from`
	to=`printf "%04d" $to`

	eval paste x{$from..$to} >tmp
	sed -i 's/;/ \& /g' tmp
	sed -i 's/	/ \& /g' tmp
	sed -i 's/$/\\\\/g' tmp
	cat tmp >>$OUT
cat >>$OUT <<EOD
\end{tabular}
\newpage
\begin{tabular}{$mask}
EOD
done

cat >>$OUT <<EOD
\end{tabular}
EOD
