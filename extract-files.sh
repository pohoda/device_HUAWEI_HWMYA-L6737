#!/bin/sh

## usage: extract-files.sh $1 $2
## $1 and $2 are optional
## if $1 = unzip the files will be extracted from zip file (if $1 = anything else 'adb pull' will be used
## $2 specifies the zip file to extract from (default = ../../../${DEVICE}_update.zip)

VENDOR=HUAWEI
DEVICE=HWMYA-L6737
BUILD_DIR=BUILD-omni

OUT=/home/el/$BUILD_DIR/vendor/$VENDOR/$DEVICE/proprietary
IN=~/Mount/sys/

## rm -rf $OUT/*

if [ -z "$2" ]; then
    ZIPFILE=../../../${DEVICE}_update.zip
else
    ZIPFILE=$2
fi

if [ "$1" = "unzip" -a ! -e $ZIPFILE ]; then
    echo $ZIPFILE does not exist.
else
    for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
        DIR=`dirname $FILE`
	if [ ! -d $OUT/$DIR ]; then
            mkdir -p $OUT/$DIR
	fi
	if [ "$1" = "unzip" ]; then
            unzip -j -o $ZIPFILE $FILE -d $OUT/$DIR
	else
            cp -r $IN$FILE $OUT/$FILE
	fi
    done
fi
echo "  "
echo " koniec extrakcie "
echo "  "
./setup-makefiles.sh
