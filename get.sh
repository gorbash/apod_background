#!/bin/bash
BASEDIR="$( cd "$(dirname "$0")" ; pwd -P )"
echo $BASEDIR
sleep 2

. ${BASEDIR}/discover_session_bus_address.sh

cd ${BASEDIR}
rm -rf apod.nasa.gov
wget -p http://apod.nasa.gov > /dev/null
IMAGE=`find apod.nasa.gov -name "*jpg"`
echo $IMAGE > ${BASEDIR}/test.log
cp $IMAGE ${BASEDIR}/current.jpg

echo "`date` setting image..." > ${BASEDIR}/test.log
gsettings set org.gnome.desktop.background picture-uri file://${BASEDIR}/current.jpg
rm -rf apod.nasa.gov
