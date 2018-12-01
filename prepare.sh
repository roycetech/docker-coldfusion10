#!/bin/sh

cd $(dirname "$0")
cd build/install

if [ ! -f "ColdFusion_10_WWEJ_linux64.bin" ]
then
	wget https://s3-ap-southeast-2.amazonaws.com/royce-sydney/public/coldfusion/ColdFusion_10_WWEJ_linux64.bin
	chmod 755 ColdFusion_10_WWEJ_linux64.bin
fi

if [ ! -f "hotfix_023.jar" ]
then
	wget https://cfdownload.adobe.com/pub/adobe/coldfusion/hotfix_023.jar
	chmod 755 hotfix_023.jar
fi

if [ ! -f "cf10_mdt_updt.jar" ]
then
	wget http://download.macromedia.com/pub/coldfusion/10/cf10_mdt_updt.jar
	chmod 755 cf10_mdt_updt.jar
fi
