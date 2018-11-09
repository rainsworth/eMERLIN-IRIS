These instructions will get you up and running doing radio data anlysis with [CASA](https://casa.nrao.edu/) in a [Jupyter Notebook](http://jupyter.org/) (using [this](https://github.com/aardk/jupyter-casa) container) via [Singularity](https://www.sylabs.io/) on a Mac. (For Linux, follow the [original instructions](https://github.com/aardk/jupyter-casa).)

---

### 1. Set up Singularity via Virtual Box and Vagrant

To get Singularity running on MacOS, we will follow [this](http://singularity.lbl.gov/install-mac) tutorial.

First, install [Homebrew](https://brew.sh/) if you haven't already:

```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Next, install [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/) via ```brew```:

```bash
$ brew cask install virtualbox
$ brew cask install vagrant
$ brew cask install vagrant-manager
```

Create a Vagrant Virtual Machine (VM) instance for Singularity:

```bash
$ mkdir singularity-vm
$ cd singularity-vm
$ vagrant init singularityware/singularity-2.4
$ vagrant up
$ vagrant ssh
```

To exit and shut down the VM:

```bash
vagrant@vagrant:~$ exit
$ vagrant halt
```

If you need to delete the VM for any reason, the command is

```bash
$ vagrant destroy
```

### 2. Prepare the VM for using CASA and Jupyter

The [Jupyter-CASA](https://github.com/aardk/jupyter-casa) kernal requires X11 and port forwarding on Vagrant VM instances, which we'll enable following [this](https://computingforgeeks.com/how-to-enable-and-use-ssh-x11-forwarding-on-vagrant-instances/) and [this](http://pythondata.com/jupyter-vagrant/).

Install xauth on the Vagrant instance that will allow X11 to work:

```bash
vagrant@vagrant:~$ sudo apt-get install xauth
```

then exit the VM:

```bash
vagrant@vagrant:~$ exit
$ vagrant halt
```

Open and edit the Vagrantfile to include the following lines for X11 and port forwarding just after the vagrant.vm name:

> config.ssh.forward_agent = true
>
> config.ssh.forward_x11 = true
>
> config.vm.network "forwarded_port", guest: 8888, host: 8888

X11 and port forwarding should now work the next time you start the Vagrant instance:

```bash
$ vagrant up
$ vagrant ssh
```

You will get the message  `/home/vagrant/.Xauthority does not exist` when you run it for the first time, but the xauth program will now create the .Xauthority file for you.

You will also want to set up Python tools within your Vagrant VM instance. I installed [Anaconda](https://anaconda.org/) following [this](https://docs.anaconda.com/anaconda/install/linux):

```bash
vagrant@vagrant:~$ mkdir Software
vagrant@vagrant:~$ cd Software/
vagrant@vagrant:~$ wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
vagrant@vagrant:~$ bash Anaconda3-5.2.0-Linux-x86_64.sh
vagrant@vagrant:~$ source ~/.bashrc
```

along with other Python tools such as setuptools and pip:

```bash
vagrant@vagrant:~$ sudo apt-get install python3-setuptools
vagrant@vagrant:~$ sudo easy_install3 pip
```

### 3. Radio data analysis in a Jupyter notebook via Singularity

Download the [jupyter-casa](https://github.com/aardk/jupyter-casa) Singularity image:

```bash
vagrant@vagrant:~$ singularity pull --name jupyter-casa.simg shub://aardk/jupyter-casa:docker
```

To simply start the Jupyter-CASA server, execute:

```bash
vagrant@vagrant:~$ singularity run jupyter-casa.simg
```

To add a data directory containing the measurement sets to run the analysis on to the container:

```bash
vagrant@vagrant:~$ singularity exec -B PATH_TO_DATA:$HOME/data jupyter-casa.simg jupyter notebook --ip=0.0.0.0
```

To execute a Jupyter-CASA notebook on data without interaction, such as deploying to HPC resources:

```bash
vagrant@vagrant:~$ singularity exec -B PATH_TO_DATA:$HOME/data jupyter-casa.simg jupyter nbconvert --ExecutePreprocessor.timeout=None --to notebook --execute $HOME/data/eMERLIN_Basic_Calibration_Tutorial.ipynb
```
