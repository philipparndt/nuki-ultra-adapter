#!/usr/bin/env bash

./render.sh base-plate.scad base-plate.stl
./render.sh keso-gear-adapter.scad keso-gear-adapter.stl
./render.sh mtl-gear-adapter.scad mtl-gear-adapter.stl
./render.sh mtl-gear-adapter.scad mtl-gear-adapter-fdm.stl -D toothClearance=0.1
