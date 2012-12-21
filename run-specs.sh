#!/bin/bash

# exit on error exit codes
set -e

# client specs
mocha --recursive --compilers coffee:coffee-script viron/client

# server specs
./manage.py test tmesis --failfast

