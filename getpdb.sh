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
	wget http://www.rcsb.org/pdb/files/$pdbid.pdb > /dev/null
	wait
done
echo "all PDB files downloaded !"