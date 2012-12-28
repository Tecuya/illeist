#!/bin/bash

# exit on error exit codes
set -e

echo "============================="
echo "Mocha:"
echo

# client specs
PATH="$PATH:/opt/phantomjs/bin" mocha-phantomjs -R tap viron/static/js/spec/tests.html

echo "============================="
echo "Django:"
echo

# server specs
./manage.py test tmesis --failfast

