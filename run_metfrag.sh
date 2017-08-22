#!/bin/bash
ADDITIONALPARAMETERS=""
LOCALDATABASEPATH=""
RESULTSPATH=""
RESULTSFILE=""
while [[ $# -gt 1 ]]
do
    key="$1"
    case $key in
            -p|--parameterfile)
            PARAMETERFILE="$2"
            shift # past argument
        ;;
            -a|--additionalparameters)
            ADDITIONALPARAMETERS="$2"
            shift # past argument
        ;;
            -l|--localdatabasepath)
            LOCALDATABASEPATH="$2"
            shift # past argument
        ;;
            -r|--resultspath)
            RESULTSPATH="$2"
            shift # past argument
	;;
            -f|--resultsfile)
            RESULTSFILE="$2"
            shift # past argument
        ;;
            *)
            # unknown option
        ;;
    esac
    shift # past argument or value
done
cmds="`cat $PARAMETERFILE`"
if [ "$ADDITIONALPARAMETERS" != "" ]; then
    cmds="$cmds $ADDITIONALPARAMETERS"
fi
if [ "$LOCALDATABASEPATH" != "" ]; then
    cmds="$cmds LocalDatabasePath=$LOCALDATABASEPATH"
fi
if [ "$RESULTSPATH" == "" ] && [ "$RESULTSFILE" == "" ]; then
    echo "Error: ResultsPath or ResultsFile needs to be defined. Use -r (ResultsPath) or -f (ResultsFile) option."
    exit 1
fi
if [ "$RESULTSFILE" != "" ]; then
    cmds="$cmds ResultsFile=$RESULTSFILE"
else
    cmds="$cmds ResultsPath=$RESULTSPATH"
fi

# run the command
java -Xmx2048m -Xms1024m -jar /usr/local/bin/MetFragCLI.jar "$cmds NumberThreads=1"
