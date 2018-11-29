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
jupyter nbconvert --to notebook --execute $HOME/data/MERLIN_Tutorial_clean.ipynb --output $HOME/data/MERLIN_Tutorial_run.ipynb --ExecutePreprocessor.timeout=None --ExecutePreprocessor.kernel_name=casapy
