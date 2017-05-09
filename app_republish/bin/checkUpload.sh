#!/bin/bash
cd $app_home/upload
rest_jar=`ls | grep $app_war_prefix*.war | wc -l`
if [ $rest_jar == 0 ];
        then echo "Please upload tripd rest war package!"
        exit
fi
if [ $rest_jar -gt 1 ];
        then echo "Upload more than one package!"
        exit
fi
if [ $rest_jar == 1 ];
        then echo "Package is uploaded!"
fi
