#!/bin/bash
echo "COMPILE--------------------------------------------"
/opt/qnx/qnx700/host/linux/x86_64/usr/bin/qcc \
-V gcc_ntoarmv7le \
-I/opt/qnx/qnx700/target/qnx7/usr/include \
-O2 \
-fPIC \
-I/mnt/c/Users/Ismo/Documents/work/MCM2/SW/bsp-mx6soloX/prebuilt/luaJIT/include/luajit-2.0 \
-c lua_zlib.c \
-o lua_zlib.o \
-DLZLIB_COMPAT 
echo "LINKING---------------------------------------------"
/opt/qnx/qnx700/host/linux/x86_64/usr/bin/qcc \
-V gcc_ntoarmv7le \
-L ../../mcm2-lua/qnx/arm/a.le.v7 \
-o zlib.so \
-l z \
-l lua \
-l m \
-shared \
lua_zlib.o 
