This directory contains an example of a multi-core (8 core) use case that can be run as-is or used as a template for your multicore job
IRIS use case

Once you have followed [these instructions](https://github.com/rainsworth/eMERLIN-IRIS/blob/master/iris_ui_docker.md), you are ready to submit jobs to IRIS. 

Follow instructions [here](https://github.com/rainsworth/eMERLIN-IRIS/blob/IRISWorkshopChanges/eMERLIN_CP_IRIS_test/README.md) for starting the UI docker container/initialising the DIRAC command line interface and setting a Grid Proxy. 

To submit a job that requests an 8 core job slot run (you might need to add executable permissions to the following script)

```
bash-4.2$ ./job-submit-multicore 
```

You can monitor the job, retrieve outputs same as described [here](https://github.com/rainsworth/eMERLIN-IRIS/blob/IRISWorkshopChanges/eMERLIN_CP_IRIS_test/README.md) 
