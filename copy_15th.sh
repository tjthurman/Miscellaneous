#! /bin/bash

mkdir copies
mkdir sharpened
mv *_S.tiff sharpened
for i in *.tif  
do
  if [i % 15 = 0]; 
  cp i copies
done