# Travis CI ROOT builds

Scripts to build [ROOT](http://root.cern.ch/) distributions for use on [Travis CI](https://travis-ci.org/).

## Motivation

If your project relies on ROOT to run its tests, and you would like to run them on Travis CI, you need a way to install ROOT.
However, Travis CI virtual machines, on which the tests run, have a limited lifetime, often too short to compile ROOT from source, and so an alternative method is needed.

The idea for this repository came from seeing how the [rootpy](http://www.rootpy.org/) team handled acquiring ROOT for use in their tests. See their [guide on continuous integration](https://github.com/rootpy/rootpy/wiki/Web-Server-and-Continuous-Integration) for more.

## Building the distributions

To use the ROOT distributions in your Travis CI tests, see the [Usage](#usage) section.

[Vagrant](http://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) are required to build the ROOT distributions supported by the repository.
These are used to run a [Ubuntu](http://www.ubuntu.com/) 12.04 LTS Server Edition 64 bit distribution, the [same OS](http://docs.travis-ci.com/user/ci-environment/#CI-environment-OS) used on the Travis CI VMs.

To set up the VM, clone this repository and provision.

```bash
$ git clone https://github.com/alexpearce/travis-ci-root-builds.git
$ cd travis-ci-root-builds
$ vagrant up --provision
```

To build the ROOT distributions, SSH in to the VM and source the build script.

```bash
$ vagrant ssh
# Now on the Vagrant guest machine
$ . /vagrant/create_builds.sh
```

Each build can take a significant amount of time, upwards of 30 minutes.

A tarball for each build will be created in the `/vagrant` folder, which in a standard Vagrant install is shared with the host machine.

## Usage

To use the builds in your tests, you need to add a few lines to the `.travis.yml` configuration file in the repository you want to test.

See the [`test-travis-builds`](https://github.com/alexpearce/test-travis-builds) repository and its [`.travis.yml`](https://github.com/alexpearce/test-travis-builds/blob/master/.travis.yml) for an example set up.

### Availability

There are publicly available builds on [Sourceforge](https://sourceforge.net/projects/travis-ci-root-builds/files/), but if you strongly depend on the availability of such builds, hosting them elsewhere might be a good idea.

As of the last commit date on this [README](README.md), the available builds are given in the table below.

#### Python 2

-            | Python 2.6                            | Python 2.7
-------------|---------------------------------------|----------------------------------------
ROOT 5.34.19 | [`ROOT-5.34.19_Python-2.6.tar.gz`][1] | [`ROOT-5.34.19_Python-2.7.tar.gz`][2]
ROOT 5.34.25 | [`ROOT-5.34.25_Python-2.6.tar.gz`][5] | [`ROOT-5.34.25_Python-2.7.tar.gz`][6]
ROOT 6.00.02 | [`ROOT-6.00.02_Python-2.6.tar.gz`][3] | [`ROOT-6.00.02_Python-2.7.tar.gz`][4]
ROOT 6.02.04 | [`ROOT-6.02.04_Python-2.6.tar.gz`][7] | [`ROOT-6.02.04_Python-2.7.tar.gz`][8]
ROOT 6.03.02 | [`ROOT-6.03.02_Python-2.6.tar.gz`][9] | [`ROOT-6.03.02_Python-2.7.tar.gz`][10]

[1]: http://downloads.sourceforge.net/project/travis-ci-root-builds/ROOT-5.34.19_Python-2.6.tar.gz
[2]: http://downloads.sourceforge.net/project/travis-ci-root-builds/ROOT-5.34.19_Python-2.7.tar.gz
[3]: http://downloads.sourceforge.net/project/travis-ci-root-builds/ROOT-6.00.02_Python-2.6.tar.gz
[4]: http://downloads.sourceforge.net/project/travis-ci-root-builds/ROOT-6.00.02_Python-2.7.tar.gz
[5]: http://downloads.sourceforge.net/project/travis-ci-root-builds/ROOT-5.34.25_Python-2.6.tar.gz
[6]: http://downloads.sourceforge.net/project/travis-ci-root-builds/ROOT-5.34.25_Python-2.7.tar.gz
[7]: http://downloads.sourceforge.net/project/travis-ci-root-builds/ROOT-6.02.04_Python-2.6.tar.gz
[8]: http://downloads.sourceforge.net/project/travis-ci-root-builds/ROOT-6.02.04_Python-2.7.tar.gz
[9]: http://downloads.sourceforge.net/project/travis-ci-root-builds/ROOT-6.03.02_Python-2.6.tar.gz
[10]: http://downloads.sourceforge.net/project/travis-ci-root-builds/ROOT-6.03.02_Python-2.7.tar.gz

#### Python 3

-            | Python 3.3                             | Python 3.4
-------------|----------------------------------------|----------------------------------------
ROOT 5.34.25 | [`ROOT-5.34.25_Python-3.3.tar.gz`][11] | [`ROOT-5.34.25_Python-3.4.tar.gz`][12]
ROOT 6.03.02 | [`ROOT-6.03.02_Python-3.3.tar.gz`][13] | [`ROOT-6.03.02_Python-3.4.tar.gz`][14]

[11]: http://downloads.sourceforge.net/project/travis-ci-root-builds/ROOT-5.34.25_Python-3.3.tar.gz
[12]: http://downloads.sourceforge.net/project/travis-ci-root-builds/ROOT-5.34.25_Python-3.4.tar.gz
[13]: http://downloads.sourceforge.net/project/travis-ci-root-builds/ROOT-6.03.02_Python-3.3.tar.gz
[14]: http://downloads.sourceforge.net/project/travis-ci-root-builds/ROOT-6.03.02_Python-3.4.tar.gz
