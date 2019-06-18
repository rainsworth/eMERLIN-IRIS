This directory contains an example of a parametric multi-core (8 core) use case that can be run as-is or used as a template for your parametric multicore job
IRIS use case

Once you have followed [these instructions](https://github.com/rainsworth/eMERLIN-IRIS/blob/master/iris_ui_docker.md), you are ready to submit jobs to IRIS. 

Follow instructions [here](https://github.com/rainsworth/eMERLIN-IRIS/blob/IRISWorkshopChanges/eMERLIN_CP_IRIS_test/README.md) for starting the UI docker container/initialising the DIRAC command line interface and setting a Grid Proxy. 

To submit a job that requests five 8 core job slots run (you might need to add executable permissions to the following script)

```
bash-4.2$ ./job-submit-parametric-multicore
```

You can monitor the job, retrieve outputs same as described [here](https://github.com/rainsworth/eMERLIN-IRIS/blob/IRISWorkshopChanges/eMERLIN_CP_IRIS_test/README.md) 

Parametric job submission is described further in detail [here](https://dirac.readthedocs.io/en/latest/UserGuide/Tutorials/JobManagementAdvanced/) 

The `job-submit-parametric-multicore` can easily be extended to submit a group of jobs (upto 1000) by adding to the `Parameters` field
Parameters are expected to be a list of strings, these strings can correspond to numbers with a defined start, step, and count.
Alternatively parameters can be the Logical File Names (LFNs) when building a use case that requires the same workflow to be run on a set of different files.
