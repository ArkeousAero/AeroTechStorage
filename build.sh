#!/bin/bash

#make root directory
version=1.0.0
root_dir=AeroTechStorage_${version}
rm -r ${root_dir}
mkdir ${root_dir}

#copy info file
cp src/info.json ${root_dir}

#copy data file
cp src/data.lua ${root_dir}

#config file
config=${root_dir}/config.lua
echo "packageable_items = {" > ${config}

#localization folder
locale_dir=${root_dir}/locale/en
mkdir -p ${locale_dir}
echo "[item-name]" > ${locale_dir}/item-names.cfg
echo "[item-group-name]" > ${locale_dir}/item-group-names.cfg
echo "aerotech-storage=AeroTech Storage" >> ${locale_dir}/item-group-names.cfg

#temp folder for graphics intermediates
tmp_dir=/tmp/smallimages
mkdir -p ${tmp_dir}
composite -gravity center src/down.png src/crate.png ${tmp_dir}/action-crate.png
composite -gravity center src/up.png src/crate.png ${tmp_dir}/action-uncrate.png

#create graphics folder
graphics=${root_dir}/graphics
mkdir ${graphics}
mkdir ${graphics}/icon
mkdir ${graphics}/crate
mkdir ${graphics}/uncrate
cp src/crate.png ${graphics}/icon/
cp src/crate.png ${graphics}/aerotech-storage.png

##ITERATE##
for item in `ls src/graphics-in | sed s/\.[^\.]*$//`; do

#add item to config
echo "\""${item}"\"," >> ${config}

#handle localization
localization=`echo ${item}-crate | sed 's/-/ /g' | sed -e "s/\b\(.\)/\u\1/g"`
echo ${item}-crate"="${localization} >> ${locale_dir}/item-names.cfg

#handle graphics
convert src/graphics-in/${item}.png -resize 20x20 ${tmp_dir}/${item}.png
composite -gravity center ${tmp_dir}/${item}.png src/crate.png ${graphics}/icon/${item}-crate.png
composite -gravity center ${tmp_dir}/${item}.png ${tmp_dir}/action-crate.png ${graphics}/crate/crate-${item}.png
composite -gravity center ${tmp_dir}/${item}.png ${tmp_dir}/action-uncrate.png ${graphics}/uncrate/uncrate-${item}.png

done
##DONE##

echo "}" >> ${config}
