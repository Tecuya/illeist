#!/bin/bash

# exit on error exit codes
set -e

# client specs
PATH="$PATH:/opt/phantomjs/bin" mocha-phantomjs viron/static/js/spec/tests.html 

# server specs
./manage.py test tmesis viron --failfast -i '^(it|ensure|must|should|specs?|examples?|deve)' -i '(specs?(.py)?|examples?(.py)?)$' --with-spec --spec-color --traverse-namespace

