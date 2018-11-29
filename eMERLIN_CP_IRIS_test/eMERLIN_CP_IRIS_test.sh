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

echo "move data and notebook into data folder:"
mkdir data
mv 3C277.1_eMERLIN.tar.gz data/
tar xvzf data/3C277.1_eMERLIN.tar.gz
mv eMERLIN_CASA_Pipeline_clean.ipynb data/
mv inputs.txt data/

echo "download the CASA eMERLIN Pipeline:"
git clone https://github.com/e-merlin/CASA_eMERLIN_pipeline.git

echo "download the jupyter-casa image:"
singularity pull --name jupyter-casa.simg shub://aardk/jupyter-casa:docker

echo "printenv in the container: "
singularity exec --cleanenv -H $PWD -B data/:$HOME/data -B CASA_eMERLIN_pipeline/:$HOME/pipeline jupyter-casa.simg printenv

singularity exec --cleanenv -H $PWD -B data/:$HOME/data -B CASA_eMERLIN_pipeline/:$HOME/pipeline jupyter-casa.simg './runjupyter_eMERLIN_CP.sh'

tar -cvf eMERLIN_CP_IRIS_test_output_$3.tar data
