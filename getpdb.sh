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
	wait
done
echo "all PDB files downloaded !"