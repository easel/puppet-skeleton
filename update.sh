#!/bin/sh
git pull
git submodule init
git submodule sync
git submodule update
