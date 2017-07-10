########################
# Copyright(c) 2014-2017 DongGuan HeWei Communication Technologies Co. Ltd.
# file    pakage.sh
# brief   
# author  Shi Kai
# version 1.0.0
# date    103月17
########################
#!/bin/bash


#sed -i "s/^#define.*_UseBox.*$/#define UseBox    1/g" config/config.h

version=`date +%Y%m%d%H%M`
#packae name need by yourself
pkgName=pkg-${version}.tar.gz
#edit pack date in you may use this
sed -i 's/^#define VERSION.*$/#define VERSION "'$version'"/g' version.cpp 

sleep 1

./build.sh || exit 1
#mkdir -p
rm -rf ./PKG
mkdir -p ./PKG/home
mkdir -p ./PKG/lib
mkdir -p ./PKG/etc
mkdir -p ./PKG/usr/sbin
mkdir -p ./PKG/var/lib

#
#cp something to dir

cd SRC && ./lrelease_translate.sh && cd ..
cp SRC/lang/*.qm ./iLinkPKG/home/images/


cp arm-usbmuxd/usbmuxd ./PKG/usr/sbin

cp -r assets/ ./PKG/etc

cd ./PKG


tar -zcvf ../$pkgName * && echo "Package iLink Success!!!" && exit 0

echo "Package iLink Failed!!!"
