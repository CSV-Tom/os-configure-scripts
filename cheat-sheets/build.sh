#!/bin/sh

FILTER=*.md                            # set search criteria
EXTENSION=tex                          # set file extension for output files
#OUTPUTPATH=bin                         # set output directory for generated files
INPUTPATH=source                       # set input directory for generated files
PANDOCINPUTFORMAT=markdown             # set input format for pandoc
PANDOCOUTPUTFORMAT=latex               # set output format for pandoc
#DEFAULTSCRIPT=default-latex.sh         # set default script

printErrorMessage()  { echo "\033[0;31m Err: $1 $2 $3 \033[0m"; } 
printStatusMessage() { echo "\033[0;32m Log: $1 $2 $3 \033[0m"; }
printOptions()       { echo "\033[0;35m Opt: $1 $2 $3 \033[0m"; } 

printHeader() {
	echo '#----------------------------------------------------------------'
	echo '# Converter script $0'  
	echo '#----------------------------------------------------------------'
}

printFooter() {
	echo '#----------------------------------------------------------------'
	echo '# Finish'
	echo '#----------------------------------------------------------------'
	echo ''
}

usage(){
        echo ''
	echo '\tUsage       : $0 [--apply-script <file.sh> --pan-output <markdown|html|latex>]'
	echo ''
	echo '\t\t--pan-output    : see manpage of pandoc'
	echo '\t\t--pan-input     : see manpage of pandoc'
	echo '\t\t--apply-script  : apply different scripts'
	echo '\t\t--dir-output    : output directory'
	echo '\t\t--dir-input     : input directory'
	echo '\t\t--filter        : set filter criteria'
	echo '\t\t--extension     : set extension'
	echo ''
	exit 1
}

printHeader

# -----------------------------------------------------
# read command line arguments
# -----------------------------------------------------
while [ $# -gt 0 ]
do
    case "$1" in
	  --extension) EXTENSION="$2"; shift;;
	     --filter) FILTER="$2"; shift;;
          --dir-input) INPUTPATH="$2"; shift;;
#	 --dir-output) OUTPUTPATH="$2"; shift;;
	  --pan-input) PANDOCINPUTFORMAT="$2"; shift;;
	 --pan-output) PANDOCOUTPUTFORMAT="$2"; shift;;
#       --apply-script) DEFAULTSCRIPT="$2"; shift;;
	       --help) usage; ;; 
		   -h) usage; ;;
    esac
    shift
done

DEFAULTSCRIPT="build-format-scripts-default/default-${PANDOCOUTPUTFORMAT}.sh"  # set default script
OUTPUTPATH="bin/${PANDOCOUTPUTFORMAT}"                            # set output directory for generated files

INPUT=$INPUTPATH/$FILTER                            # set input
AUTOGENFILE=cheat-sheet-global.$EXTENSION           # set name of auto-generated file
rm -rf $OUTPUTPATH                                  # remove auto-generated content
mkdir -p $OUTPUTPATH                                # create directory for auto-generated content

printOptions "Filter             : $FILTER"
printOptions "Extension          : $EXTENSION"
printOptions "Inp-directory      : $INPUTPATH"
printOptions "Out-directory      : $OUTPUTPATH"
printOptions "Input              : $INPUT"
printOptions "Pandoc-Format-Inp  : $PANDOCINPUTFORMAT"
printOptions "Pandoc-Format-Out  : $PANDOCOUTPUTFORMAT"
printOptions "Default-Script     : $DEFAULTSCRIPT"

echo "" > $OUTPUTPATH/$AUTOGENFILE
for file in $INPUT
do
	# set name of output file
        OUTPUTFILE=$OUTPUTPATH/`basename $file`.$EXTENSION

	# convert
	pandoc $file -f $PANDOCINPUTFORMAT -t $PANDOCOUTPUTFORMAT -s -o $OUTPUTFILE
	printStatusMessage "Converted input file(format=$PANDOCINPUTFORMAT) '$file' to output file(format=$PANDOCOUTPUTFORMAT) '$OUTPUTFILE'. Done!"

	# apply scripts
	printStatusMessage "Start to apply script '$DEFAULTSCRIPT'"	
	./$DEFAULTSCRIPT --input $OUTPUTFILE
	printStatusMessage "Finish script '$DEFAULTSCRIPT'"
	
	cat $OUTPUTFILE >> $OUTPUTPATH/$AUTOGENFILE
done

printFooter
