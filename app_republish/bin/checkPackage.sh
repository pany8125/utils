#!/bin/bash

cd $tomcat_home/webapps
rest_jar=`ls | grep ROOT.war | wc -l`
if [ $rest_jar == 0 ];
        then echo "Current rest war package is not exist!"
        exit
fi
if [ $rest_jar -gt 1 ];
        then echo "More than one rest war package!"
        exit
fi
if [ $rest_jar == 1 ];
        then echo "ROOT.war is exist!"
fi

