This repo contains the files to demonstrate submitting a MERLIN test notebook to IRIS.

Once you have followed [these instructions](https://github.com/rainsworth/eMERLIN-IRIS/blob/master/iris_ui_docker.md), you are ready to submit jobs to IRIS. 

In this example, the following data and notebook based on [this tutorial](http://www.black-hole.eu/index.php/schools-workshops-and-conferences/2nd-school-on-multiwavelength-astronomy/course-materials/164-merlin-data) are already stored on the DIRAC File Catalogue:
- 3C277.1.MULTTB (stored as LFN:/skatelescope.eu/user/r/rachael.ainsworth/notebook_test/3C277.1.MULTTB)
- MERLIN_Tutorial_clean.ipynb (stored as LFN:/skatelescope.eu/user/r/rachael.ainsworth/notebook_test/MERLIN_Tutorial_clean.ipynb)

1. Start outside of Docker.

2. Copy the following job submit files from this repo to into the working directory you are binding to the user interface Docker container for IRIS (```$HOME/iris-ui-home``` in [this example](https://github.com/rainsworth/eMERLIN-IRIS/blob/master/iris_ui_docker.md)) which should already contain your .p12 file:
- [MERLIN-jobsubmit](https://github.com/rainsworth/eMERLIN-IRIS/blob/master/MERLIN_IRIS_test/MERLIN-jobsubmit) (the script to submit a job to IRIS)
- [MERLIN_IRIS_test.sh](https://github.com/rainsworth/eMERLIN-IRIS/blob/master/MERLIN_IRIS_test/MERLIN_IRIS_test.sh) (the script to be executed on the Grid which does some housekeeping, moves the data and notebook from the file catalogue into a local ```data``` folder, pulls and runs the Singularity jupyter-casa image)
- [runjupyter_MERLIN.sh](https://github.com/rainsworth/eMERLIN-IRIS/blob/master/MERLIN_IRIS_test/runjupyter_MERLIN.sh) (the script to be executed within the container which does some housekeeping and executes the Jupyter notebook)

3. Run the UI Docker container for IRIS, binding your working directory which contains the job submit scripts and your .p12 certificate (replace ```$HOME/iris-ui-home``` with the full path of the directory you want to bind):

```
> docker run --user user --tty --interactive --volume $HOME/iris-ui-home:/home/user --workdir /home/user irisacuk/iris-ui:latest /bin/bash
bash-4.2$
```

4. To enable the Grid and DIRAC commands execute the command:

```
bash-4.2$ source /usr/local/gridpp-dirac/bashrc
```

5. Initialise a DIRAC proxy:

```
bash-4.2$ dirac-proxy-init -g skatelescope.eu_user -M
Generating proxy...
Enter Certificate password:
```

6. Submit the job!
```
bash-4.2$ ./MERLIN-jobsubmit 
```

7. Monitor job at https://dirac.gridpp.ac.uk:8443

8. Retrieve job output (replace with associated JobID):
```
bash-4.2$ dirac-wms-job-get-output JobID
```
This will download the output job logs and errors as StdOut and StdErr.


9. Retrieve output data which were saved to the file catalogue (replace with associated JobID):
```
bash-4.2$ dirac-dms-get-file LFN:/skatelescope.eu/user/r/rachael.ainsworth/notebook_test/MERLIN_IRIS_test_output_JobID.tar
```
This will download a tar file containing the executed notebook and pipeline products. You can view the executed notebook locally following e.g. [these guidelines](https://github.com/rainsworth/eMERLIN-IRIS/blob/master/docker_mac.md).
