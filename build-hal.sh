#!/bin/bash
source halium.env
cd $ANDROID_ROOT

source build/envsetup.sh
breakfast $DEVICE
export USE_HOST_LEX=yes
make -j$(nproc) mkbootimg
make -j$(nproc) halium-boot
make -j$(nproc) systemimage 

echo "md5sum halium-boot.img and system.img"
md5sum $ANDROID_ROOT/out/target/product/mido/halium-boot.img
md5sum $ANDROID_ROOT/out/target/product/mido/system.img
