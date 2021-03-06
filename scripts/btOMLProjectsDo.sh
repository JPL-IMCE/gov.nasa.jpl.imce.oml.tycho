#!/bin/bash


function vp() {
    version=$1
    echo "# Publish all package versions '$version'...";
    for p in ${projects[*]}; do

	echo "=> $p";
	jfrog bt vp jpl-imce/gov.nasa.jpl.imce.oml/$p/$version
    
    done
}

function vd() {
    version=$1
    echo "# Delete all package versions '$version'...";
    for p in ${projects[*]}; do

	echo "=> $p";
	jfrog bt vd --quiet=true jpl-imce/gov.nasa.jpl.imce.oml/$p/$version 
    
    done
}

function ps() {
for p in ${projects[*]}; do

    echo "#";
    echo "# => $p";
    echo "#";
    jfrog bt ps jpl-imce/gov.nasa.jpl.imce.oml/$p 
    
done
}


function psl() {
for p in ${projects[*]}; do

    echo "#";
    echo "# => $p";
    echo "#";
    jfrog bt ps jpl-imce/gov.nasa.jpl.imce.oml/$p | grep '\"\(name\|latest_version\)\"'
    
done
}

declare -a projects

# The list below needs to reflect the output of this query:
#
# curl -u <user>:<apikey> https://api.bintray.com/repos/jpl-imce/gov.nasa.jpl.imce.oml/packages  | jq .[].name

projects[0]=gov.nasa.jpl.imce.oml.root
projects[1]=gov.nasa.jpl.imce.oml.plugins
projects[2]=gov.nasa.jpl.imce.oml.uuid
projects[3]=gov.nasa.jpl.imce.oml.model
projects[4]=gov.nasa.jpl.imce.oml.model.edit
projects[5]=gov.nasa.jpl.imce.oml.dsl
projects[6]=gov.nasa.jpl.imce.oml.dsl.ide
projects[7]=gov.nasa.jpl.imce.oml.dsl.ui
projects[8]=gov.nasa.jpl.imce.oml.rcp
projects[9]=gov.nasa.jpl.imce.oml.features
projects[10]=gov.nasa.jpl.imce.oml.feature
projects[11]=gov.nasa.jpl.imce.oml.tests
projects[12]=gov.nasa.jpl.imce.oml.tests.core
projects[13]=gov.nasa.jpl.imce.oml.dsl.tests
projects[14]=gov.nasa.jpl.imce.oml.releng
projects[15]=gov.nasa.jpl.imce.oml.target
projects[16]=gov.nasa.jpl.imce.oml.updatesite
projects[17]=gov.nasa.jpl.imce.oml.product
projects[18]=gov.nasa.jpl.imce.oml.viewpoint
projects[19]=gov.nasa.jpl.imce.oml.zip
projects[20]=gov.nasa.jpl.imce.oml.serialization.tests
projects[21]=gov.nasa.jpl.imce.oml.rcp.feature

if test $# -eq 1 && test "$1" = "ps"; then
    echo "# Package Show...";
    ps;
elif test $# -eq 1 && test "$1" = "psl"; then
    echo "# Package Show (latest version)...";
    psl;
elif test $# -eq 2 && test "$1" = "vd"; then
    vd $2;
elif test $# -eq 2 && test "$1" = "vp"; then
    vp $2;
else
    echo "#";
    echo "# Usages:";
    echo "#";
    echo "# Show all package versions";
    echo "$0 ps";
    echo "#";
    echo "# Delete a specific version of all packages, if available";
    echo "$0 vd <version>";
    echo "#";
    echo "# Publish a specific version of all packages, if available";
    echo "$0 vp <version>";
    echo "#";
fi

