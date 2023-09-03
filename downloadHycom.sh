#!/bin/sh

yyyy="2012"
mm="12"
dd="31"

north="-18"
south="-22"
east="-34"
west="-41"

file=./data/hycom_${yyyy}${mm}${dd}.nc

wget -O $file "http://ncss.hycom.org/thredds/ncss/GLBu0.08/expt_19.1/${yyyy}?var=salinity&var=water_temp&north=${north}&west=${west}&east=${east}&south=${south}&disableLLSubset=on&disableProjSubset=on&horizStride=1&time_start=${yyyy}-${mm}-${dd}T00%3A00%3A00Z&time_end=${yyyy}-${mm}-${dd}T00%3A00%3A00Z&timeStride=1&vertCoord=&accept=netcdf"