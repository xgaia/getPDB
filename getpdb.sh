#! /bin/bash

function usage(){
	echo "write some PDB id after the command name"
}

n=$#

if [[ $n == 0 ]]; then
        usage
        exit
fi

pdbs=${*^^}

for pdbid in $pdbs
do
	echo "Downloading " $pdbid "..."
	wget --quiet http://www.rcsb.org/pdb/files/$pdbid.pdb
	if [[ $? != 0 ]]; then
		echo "===>  $pdbid doesn't exist !  <==="
	fi
	
	wait
done
echo "Done !"