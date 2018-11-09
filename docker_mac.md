These instructions will get you up and running doing radio data anlysis with [CASA](https://casa.nrao.edu/) in a [Jupyter Notebook](http://jupyter.org/) (using [this](https://github.com/aardk/jupyter-casa) container) via [Docker](https://www.docker.com/) on a Mac. (For Linux, follow the [original instructions](https://github.com/aardk/jupyter-casa).)

---

### 1. Install Docker

Ensure you have [XQuartz](https://www.xquartz.org/releases/index.html) installed if you haven't already, as we will be running a container requiring a GUI (you will need to log out and back in to OS X).

Download, install and run Docker via https://www.docker.com/get-started.


### 2. Radio data analysis in a Jupyter notebook via Docker

Download the [jupyter-casa](https://github.com/aardk/jupyter-casa) Docker image:
```
> docker pull penngwyn/jupytercasa
```

Following [this](https://fredrikaverpil.github.io/2016/07/31/docker-for-mac-and-gui-applications/) tutorial for running containers requiring a GUI, execute the following commands:

```
> open -a XQuartz
> ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
> xhost + $ip
```

To simply start the Jupyter-CASA server, execute:
```
> docker run --rm -p 8888:8888 -i -t -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$ip:0 penngwyn/jupytercasa /bin/sh -c "jupyter notebook"
```
then copy and paste the URL token into your browser and open up a new Casa notebook.

To add a data directory containing the measurement sets to run the analysis on to the container:
```
> docker run --rm -p 8888:8888 -i -t -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$ip:0 -v PATH_TO_DATA:/home/jupyter/data penngwyn/jupytercasa /bin/sh -c "jupyter notebook"
```
