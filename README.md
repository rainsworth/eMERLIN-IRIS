


![](http://www.e-merlin.ac.uk/images/e-MERLIN_logo_smallish_icon.png) 
# e-MERLIN @ IRIS 

Next generation radio interferometers are confronting formidable technological challenges. Data rates from the [Square Kilometre Array](https://www.skatelescope.org/) (SKA) - a global science and engineering project to build the world's largest radio telescope - will soon overtake those of global Internet traffic, requiring innovation in the way we transport, store and process data. [e-MERLIN](http://www.e-merlin.ac.uk/), the UK’s national radio astronomy facility operated by [Jodrell Bank](http://www.jodrellbank.manchester.ac.uk/), is a pathfinder instrument engaged in SKA related technology and science studies. 

This project involves using e-MERLIN as a testbed for tackling these big data challenges, while also making radio astronomy more accessible to everyone. It will be a service to provide interactive radio data analysis on the cloud using [IRIS](https://www.iris.ac.uk/) resources, inspired by CERN’s Service for Web based Analysis ([SWAN](https://swan.web.cern.ch/)). It will provide archive storage for the large data outputs from e-MERLIN which will comply with FAIR (Findable, Accessible, Interoperable, Reusable) data standards, a [Jupyter Notebook](https://jupyter.org/) interface for accessing and calibrating the data with observatory standard pipelines (which can be adapted/modified by the user), distributed computing for processing via DiRAC, and facilities for sharing and collaborating with other users. 

This project facilitates transparency and reproducibility for radio astronomy - fundamental aspects of the scientific method currently undergoing crisis in research - through the use of containers, open notebooks and open source software developed by the community. Crucially, the provision of computing resources will make the field accessible to those who cannot afford large clusters to manage the large amounts of data. e-MERLIN will become a flagship facility for Open Science.

## TL;DR

This repository contains instructions and example files for conducting reproducible radio data analysis with [CASA](https://casa.nrao.edu/) in a [Jupyter Notebook](https://jupyter.org/) using the [jupyter-casa kernel](https://github.com/aardk/jupyter-casa) on [IRIS](https://www.iris.ac.uk/) resources.

## Getting started

Before you are able to do anything, read [this how-to](https://github.com/MANHEP/man-dirac/blob/master/READMEnew) on getting started with DIRAC job submission. It tells you how to:

1. Get a grid certificate
2. Import the certificate/key to your web browser
3. Joining a virtual organization
4. Convert certificate/key to PEM format
5. Set up the GridPP DIRAC commands on your account on a Linux machine
6. Submit jobs (which will also be outlined in this repo)
7. Monitor your jobs using the DIRAC portal

## Submitting jobs to IRIS via Docker

Follow the instructions in [iris_ui_docker.md](https://github.com/rainsworth/eMERLIN-IRIS/blob/master/iris_ui_docker.md) to submit jobs to IRIS via Docker on your local machine.

## (e)MERLIN example jobs

There are two example directories in this repository for submitting jobs to reduce (e)MERLIN data:

1. [eMERLIN_CP_IRIS_test](https://github.com/rainsworth/eMERLIN-IRIS/tree/master/eMERLIN_CP_IRIS_test) which demonstrates submitting an [eMERLIN CASA Pipeline](https://github.com/e-merlin/eMERLIN_CASA_pipeline) test notebook to IRIS.
2. [MERLIN_IRIS_test](https://github.com/rainsworth/eMERLIN-IRIS/tree/master/MERLIN_IRIS_test) which demonstrates submitting a MERLIN test notebook to IRIS.


## Reproducible radio data analysis

This repo also contains instructions to get you up and running doing radio data anlysis with CASA in a Jupyter Notebook (using [this container](https://github.com/aardk/jupyter-casa)) locally via [Singularity on a Mac](https://github.com/rainsworth/eMERLIN-IRIS/blob/master/singularity_mac.md) or via [Docker on a Mac](https://github.com/rainsworth/eMERLIN-IRIS/blob/master/docker_mac.md). (For Linux, follow the [original instructions](https://github.com/aardk/jupyter-casa).)

---

*This project repository is under construction. Apologies for incompleteness, but please submit an issue or pull request if you would like to contribute or make suggestions!*
