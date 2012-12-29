#!/bin/bash

# exit on error exit codes
set -e

echo '--------------------- Mocha Specs ----------------------'

# client specs
PATH="$PATH:/opt/phantomjs/bin" mocha-phantomjs http://localhost:8000/spec

echo '----------------- Server Specs/Tests -------------------'

# server specs - reusing DB should be safe because we dont use any
# transaction test cases. the complicated arguments output arguments
# are taken from specloud
REUSE_DB=1 ./manage.py test -v 0 tmesis viron --failfast \
-i '^(it|ensure|must|should|specs?|examples?|deve)'  \
-i '(specs?(.py)?|examples?(.py)?)$' --with-spec \
--spec-color --traverse-namespace

