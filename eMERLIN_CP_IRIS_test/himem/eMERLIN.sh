#!/bin/bash
/bin/hostname
/bin/date
/bin/ls -la
printenv
singularity --version
echo "=============================================================="

# Data prep: untar the input, and pipeline and move to appropriate directories
tar -xvzf 3C277.1_eMERLIN.tar.gz
mv eMERLIN_CASA_Pipeline_clean.ipynb data/
mv inputs.txt data/
tar -xvzf CASA_eMERLIN_pipeline.tar.gz
mv CASA_eMERLIN_pipeline pipeline


echo "printenv in the container: "
singularity exec --cleanenv --home $PWD:/srv --pwd /srv -C  shub://aardk/jupyter-casa:docker printenv
echo "run jupyter notebook in container"
singularity exec --cleanenv --home $PWD:/srv --pwd /srv -C  shub://aardk/jupyter-casa:docker './runjupyter_eMERLIN_CP.sh'

# Tar up the output named in a unique way for DIRAC to find
tar -cvf eMERLIN_CP_IRIS_test_output_$1.tar data
