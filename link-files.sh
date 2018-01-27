#!/bin/bash

ln -Fsv $(git ls-tree --name-only HEAD | sed "/^$(basename $0)$/d" | awk -v P=$(pwd) '{print P"\/" $0}') ~
