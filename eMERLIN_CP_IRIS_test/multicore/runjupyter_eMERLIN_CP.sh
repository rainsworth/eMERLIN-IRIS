echo "=============================================================="

echo "jupyter version in container: "
jupyter --version

echo "jupyter location in container: "
which jupyter

echo "casa location in container: "
which casa

echo "python location in container: "
which python

echo "executing notebook: "
jupyter nbconvert --to notebook --execute $HOME/data/eMERLIN_CASA_Pipeline_clean.ipynb --output $HOME/data/eMERLIN_CASA_Pipeline_run.ipynb --ExecutePreprocessor.timeout=None --ExecutePreprocessor.kernel_name=casapy
