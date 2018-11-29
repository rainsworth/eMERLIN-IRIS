#!/bin/bash
/bin/hostname
/bin/date
/bin/ls -la
printenv
echo "=============================================================="

echo "kernal version check:"
uname -r

echo "shell:"
echo $0

echo "printing singularity version on grid:"
singularity --version

echo "jupyter version on grid:"
jupyter --version

echo "jupyter location on grid:"
which jupyter

echo "casa location on grid:"
which casa

echo "python location on grid:"
which python

mkdir data
mv 3C277.1.MULTTB data/
mv MERLIN_Tutorial_clean.ipynb data/

singularity pull --name jupyter-casa.simg shub://aardk/jupyter-casa:docker

echo "printenv in the container: "
singularity exec --cleanenv -H $PWD -B data/:$HOME/data jupyter-casa.simg printenv

singularity exec --cleanenv -H $PWD -B data/:$HOME/data jupyter-casa.simg './runjupyter_MERLIN.sh'

tar -cvf MERLIN_IRIS_test_output_$3.tar data
