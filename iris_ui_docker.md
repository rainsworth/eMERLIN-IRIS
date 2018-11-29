

## Submitting jobs to IRIS via Docker 

### 1. Prerequisites

First, you will need a Grid certificate (.p12 file). To get a Grid certificate, follow the directions here: https://github.com/MANHEP/man-dirac/blob/master/READMEnew


If you haven't already, download, install and run Docker via https://www.docker.com/get-started.


### 2. Using the user interface Docker container for IRIS

Download the [iris-ui](https://github.com/iris-ac-uk/iris-ui) Docker image:

```
> docker pull irisacuk/iris-ui
```

Copy your Grid certificate (.p12 file) to the directory you want to bind to the container. In the example below, this directory is called ```$HOME/iris-ui-home``` which will also contain the files and scripts we want to submit to IRIS.


On Linux or macOS, a command like this may be used to create and enter an iris-ui Docker container as a non-privileged user (change the volume to the full path of the relevant directory you want to bind):


```
> docker run --user user --tty --interactive --volume $HOME/iris-ui-home:/home/user --workdir /home/user irisacuk/iris-ui:latest /bin/bash
bash-4.2$
```

You are now in the user interface Docker container for IRIS. To enable the Grid and DIRAC commands execute the command:

```
bash-4.2$ source /usr/local/gridpp-dirac/bashrc
```

Next, use your .p12 file in the container to generate user certificates and keys in order to set up a DIRAC proxy:

```
bash-4.2$ mkdir -p $HOME/.globus
bash-4.2$ openssl pkcs12 -in something.p12 -clcerts -nokeys -out $HOME/.globus/usercert.pem
Enter Import Password:
MAC verified OK

bash-4.2$ openssl pkcs12 -in something.p12 -nocerts -out $HOME/.globus/userkey.pem
Enter Import Password:
MAC verified OK
Enter PEM pass phrase:
Verifying - Enter PEM pass phrase:

bash-4.2$ chmod 0400 .globus/userkey.pem
```

You are now set up to execute Grid and DIRAC commands. To initialise a DIRAC proxy:

```
bash-4.2$ dirac-proxy-init -g skatelescope.eu_user -M
Generating proxy...
Enter Certificate password:
```

