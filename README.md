# What is Docker
Docker is a really cool framework that lets you put different parts of your applications in containers which are much smaller faster lighterweight things that are sort of similar to a VM.
You can learn more about containers and docker specifically at the "[What is Docker](https://www.docker.com/whatisdocker/)" page

You can find more details about how this all works (and links to some supporting files at adobe) in my blog post on [creating a coldfusion docker container](http://code.rawlinson.us/2014/08/create-a-coldfusion-docker-container.html).

# What is ColdFusion?
ColdFusion is two things - a server created by Adobe Inc.  This server parses and serves pages written in one of two dialects of ColdFusion - CFML (markup language) and CFSCRIPT (script).

There are some open source competitors to Adobe ColdFusion server such as Railo and BlueDragon.  This container provides a linux based installation of Adobe's ColdFusion Server 10 patched to hotfix version 13.

Download the binary from Adobe and put it on your network where it is accessible. You need to do this so the prepare.sh works. Once you login to the Adobe site you can get the relevant binary from http://trials3.adobe.com/AdobeProducts/CSTD/11/linux64/ColdFusion_11_WWEJ_linux64.bin – just change the CSTD/11/ to CSTD/10/ if you want CF 10 and change the 11 in the bin file and directory path to 10. Like so: http://trials3.adobe.com/AdobeProducts/CSTD/10/linux64/ColdFusion_10_WWEJ_linux64.bin


# How to use this repository

ColdFusion 10 as Docker image on Ubuntu 14.04.

If you are on a VM or something and you need to download the coldfusion binary and patch files from a local file server update prepare.sh and then run it.

    ./prepare.sh

Once you have the CF binary and patches in the /install/build directory you can build the Docker container:

    docker build -t coldfusion10_mxunit .

And run it with:

    docker run -d -p 8500:80 -v <full-path-to-your-cf-project>:/var/www/<contextpath> coldfusion10_mxunit

# Credits
This is entirely based on the work found at https://github.com/finalcut/docker-coldfusion10

The silent installation of ColdFusion is accomplished with a ./build/install/installer.profile file. The syntax for that file is described in this [Adobe blog post](: http://blogs.adobe.com/cfdoc/2009/10/performing_a_silent_installation_of_coldfusion_9.html).


The CF installation script was written by Jan Ruusuvuori and seems to only exist in this [forum post](https://forums.adobe.com/message/4721871).  I just updated that script to include the installation of the hotfixes.


# What odd stuff do I need to know?


1. The admin password for the coldfusion server is `Adm1n$`
2. You can't access the cf-admin interface from the web. You need to use the CF Admin API
3. You can learn more about the coldfusion installation by looking in `./build/install/installer.profile`
4. If you want to build your own container instead of using this one check out [these instructions](https://github.com/finalcut/docker-coldfusion10/blob/master/BUILD_INSTRUCTIONS.md)
5. Finally, I map port 80 on the CF server to port 8880 and I have it in the usage instructions here to make it easier for me to copy paste.  Use whatever port mapping works for you.

# Fork information
Added the following changes:

1. Change security update to the latest. Last update was Nov 2017, v23.
2. Fix the health check in the script `wget -O`
3. Changed the location of the installers to my personal s3 bucket. Original locations in the script are no longer accessible. File was copied from the links in this website: [](http://www.cfmlrepo.com/)
4. Added mxunit and testbox.
5. Changed run instruction to include your project folder.
