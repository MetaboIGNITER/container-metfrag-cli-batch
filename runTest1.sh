#!/bin/bash

# install required packages
apt-get update -y && apt-get install -y --no-install-recommends wget ca-certificates

# get test case data
mkdir /tmp/testfiles
wget -O /tmp/testfiles/test_case_candidates.csv https://github.com/phnmnl/container-metfrag-cli-batch/raw/develop/testfiles/test_case_candidates.csv

# perform test case
java -jar /usr/local/bin/MetFragCLI.jar "ResultsFile=/tmp/test_case.csv NumberThreads=1 DatabaseSearchRelativeMassDeviation=5 FragmentPeakMatchAbsoluteMassDeviation=0.001 FragmentPeakMatchRelativeMassDeviation=5 MetFragDatabaseType=LocalCSV MetFragScoreTypes=FragmenterScore NeutralPrecursorMass=253.966126 IsPositiveIonMode=True PrecursorIonType=[M+H]+ MetFragPeakListReader=de.ipbhalle.metfraglib.peaklistreader.FilteredStringTandemMassPeakListReader MetFragCandidateWriter=CSV PeakListString=90.97445_681;106.94476_274;110.02750_110;115.98965_95;117.98540_384;124.93547_613;124.99015_146;125.99793_207;133.95592_777;143.98846_478;144.99625_352;146.00410_999;151.94641_962;160.96668_387;163.00682_782;172.99055_17;178.95724_678;178.97725_391;180.97293_999;196.96778_720;208.96780_999;236.96245_999;254.97312_999 SampleName=test_case LocalDatabasePath=/tmp/testfiles/test_case_candidates.csv"

# check output
if [ ! -f /tmp/test_case.csv ]; then exit 1; fi
if [ "$(wc -l /tmp/test_case.csv | cut -d" " -f1)" -ne "225" ] 
then 
	echo "Unexpected number of candidates." 
	exit 1
fi
