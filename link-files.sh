#!/bin/bash

ln -Fsv $(git ls-tree --name-only HEAD | sed "/^$(basename $0)$/d;/^\.gitmodules$/d" | awk -v P=$(pwd) '{print P"\/" $0}') ~
