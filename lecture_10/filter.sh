#!/bin/bash
rm -f data.txt
for x in cc*.rpt; do
	data=$(echo $x | sed 's/_/ /g' | sed 's/\./ /g');
	size=$(echo "$data" | cut -d \  -f2,2)
	asoc=$(echo "$data" | cut -d \  -f3,3)
	miss=$(cat "$x" | grep "Demand Misses" | sed 's/	/ /g' | tr -s " " | cut -d\  -f4,4)
	fetch=$(cat "$x" | grep "Demand Fetches	" | sed 's/	/ /g' | tr -s " " | cut -d\  -f4,4)
	ic=$(cat "$x" | grep "Demand Fetches	" | sed 's/	/ /g' | tr -s " " | cut -d\  -f5,5)
	read=$(cat "$x" | grep "Demand Fetches	" | sed 's/	/ /g' | tr -s " " | cut -d\  -f7,7)

	echo "$size	$asoc	$fetch	$miss	$ic	$read" >> data.txt
done

cat data.txt | sort -nk1 -nk2 > data1.txt
rm data.txt
echo "SIZE	ASSOC	FETCHES	MISSES	IC	READ" > data.txt
cat data1.txt >> data.txt
cat data.txt
