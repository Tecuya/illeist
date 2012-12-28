#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OLDPWD=$( pwd )

cd $DIR

coffee -o viron/static/js -cw viron/client/*.coffee &
coffee -o viron/static/js/spec -cw viron/client/spec/*.coffee &
cd $OLDPWD
