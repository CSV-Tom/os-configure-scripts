#!/bin/sh

INPFILE=''
OUTFILE=''

printErrorMessage()  { echo "\033[0;31m Err: $1 $2 $3 \033[0m"; } 
printStatusMessage() { echo "\033[0;32m Log: $1 $2 $3 \033[0m"; }
printOptions()       { echo "\033[0;35m Opt: $1 $2 $3 \033[0m"; } 

usage(){
        echo ''
	echo '\tUsage       : $0 [--input <directory|file>]'
	echo ''
	exit 1
}

# -----------------------------------------------------
# read command line arguments
# -----------------------------------------------------
while [ $# -gt 0 ]
do
    case "$1" in
        --input) INPFILE="$2"; shift;;
         --help) usage; ;; 
             -h) usage; ;;
    esac
    shift
done

[ -z $INPFILE ] && usage                # check if input empty
[ -f $INPFILE ] && printStatusMessage "File '$INPFILE' found!" || printErrorMessage "File '$INPFILE' not found!"  # check if file exists

printStatusMessage "Input file '$INPFILE'"

sed -i '1,/\\begin{document}/ d' $INPFILE			# Delete all until \begin{document}
sed -i 's/\\begin{verbatim}/\\begin{lstlisting}/g' $INPFILE	# Replace verbatim to lstlisting
sed -i 's/\\end{verbatim}/\\end{lstlisting}/g' $INPFILE	  	# 	
sed -i 's/\\href{/\\footnote{/g' $INPFILE			# Replace href with footnote 
sed -i 's/\\end{document}//g' $INPFILE				# Delete \end{document}

sed -i 's/\\{longtable}/{tabular}/g' $INPFILE				# Delete \end{document}

sed -i 's/ü/\\"u/g' $INPFILE 
sed -i 's/Ü/\\"U/g' $INPFILE 
sed -i 's/ä/\\"a/g' $INPFILE 
sed -i 's/Ä/\\"A/g' $INPFILE 
sed -i 's/ö/\\"o/g' $INPFILE 
sed -i 's/Ö/\\"O/g' $INPFILE 
sed -i 's/ß/{\\ss}/g' $INPFILE 

echo '\\vfill'   >> $INPFILE          
echo '\\newpage' >> $INPFILE          
