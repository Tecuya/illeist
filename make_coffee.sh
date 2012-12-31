#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OLDPWD=$( pwd )

cd $DIR

coffee -o viron/static/js/ -cw viron/client/
cd $OLDPWD
