#!/bin/sh

mkdir -p bin

cd bin

ln -s ../latex-includes
ln -s ../latex-local-content
ln -s ../../bin/latex
ln -s ../Makefile

INPUT="latex/*.tex"

make clean

for file in $INPUT
do
	echo $file
	cp ../main.tex .
	sed -i "s@\@{var-file}@$file@g" main.tex
		
	make 
	make clean
	
	OUTFILENAME=`basename $file`
	mv main.pdf "${OUTFILENAME}.pdf"
done
