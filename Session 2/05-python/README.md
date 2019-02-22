# Python for Customer Analytics

We can use [Python](https://www.python.org) for Customer Analytics as well. While is not the goal of this course. In each of the session you can check and practice some examples.

## Installing Python in Mac (using homebrew)

First we must install [HomeBrew](https://brew.sh) using the terminal:

``` 
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
``` 

Now we can install the latest version of python:

``` 
brew install python3
``` 

We will need to install [pip](https://pypi.org/project/pip/) (recommended for the installation of other packages):

``` 
pip3 install --upgrade pip setuptools wheel
``` 

And create an environment and the folder that we will use for our projects:

``` 
pip3 install virtualenv virtualenvwrapper
mkdir ~/Python-Projects
``` 

We configure the environment (en mi case Python-Projects, other path can be considered):

``` 
echo '# needed for virtualenvwrapper' >> ~/.profile
echo export 'WORKON_HOME=$HOME/.virtualenvs' >> ~/.profile
# replace Projects with the name you gave your folder
echo export 'PROJECT_HOME=$HOME/Python-Projects' >> ~/.profile
echo export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3 >> ~/.profile
echo export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv >> ~/.profile
echo export PIP_REQUIRE_VIRTUALENV=true >> ~/.profile
echo source /usr/local/bin/virtualenvwrapper.sh >> ~/.profile
source ~/.profile
``` 

We active our environment (in our ca - customer analytics-):

``` 
mkvirtualenv ca
``` 

Each time we want to work with the environment just execute:

``` 
workon ca
``` 

## Managing your packages

First we need a requirements.txt file (that has a list of the packages in our project)

``` 
pip freeze > requirements.txt
``` 

Then, we can use pip-upgrader to review the new packages. First we install it and then:

``` 
pip install pip-upgrader
``` 

If you have a requirements.txt file (in your folder):

``` 
cd Python-Projects
pip-upgrade
``` 

## Installing base packages for data science

``` 
brew install pkg-config libpng freetype xlrd
pip3 install numpy scipy matplotlib pandas sympy nose mlxtend
``` 

## Atom

There are many GUI for Python. In our case, we are using [Atom](https://atom.io) and the package [hydrogen](https://atom.io/packages/hydrogen).

Atom (with hydrogen) is able to simulate Jupiter notebooks in your code. It need ipykernel.

``` 
python -m pip install ipykernel 
python -m ipykernel install 
``` 

## Installing Jupyter

This is optional. Jupyter is an interactive Python environment. Install jupyter with:

``` 
pip3 install jupyter:
``` 

Run Jupyter with:

``` 
Jupyter notebook
``` 

## Updating python

``` 
brew update
brew upgrade python3
``` 

``` 
find ~/.virtualenvs/ca/ -type l -delete
virtualenv ~/.virtualenvs/ca
``` 