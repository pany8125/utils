#!/bin/bash
# author: Scott 2017-5-10
#
# usage:
# 1.update app_home and tomcat_home by your app 
# 2.execute!
#
# app folder structure:
# ../3dsns
#       /bin #executable files
#       /upload #where to upload war package
#       /bak #history package backup
# tomcat webapps folder:
#       ROOT.war #rename from xxxxrest.war
#       ROOT/ #unzip by tomcat

app_home="/home/root1/tripd_sns_republish"
tomcat_home="/opt/apache-tomcat-7.0.55"
app_war_prefix="tripd_sns-rest"
app_log_prefix="tripdsns-rest"

echo 'starting update package'

echo 'check war package...'
source $app_home/bin/checkUpload.sh

cd $app_home/upload
rest_war=`ls | grep $app_war_prefix*.war`
echo "package name: "$rest_war

echo 'stopping tomcat service...'
sh $tomcat_home/bin/shutdown.sh

echo 'starting update war package...'
source $app_home/bin/checkPackage.sh

echo 'backup current package'
mv $tomcat_home/webapps/ROOT.war $app_home/bak/ROOT.war`date +%Y%m%d%H%M%S`
# check tomcat_home is not null!!!
rm -fR $tomcat_home/webapps/ROOT/
echo 'update package...'
mv $app_home/upload/$rest_war $tomcat_home/webapps/ROOT.war

source $app_home/bin/checkPackage.sh

echo 'starting tomcat service...'
sh $tomcat_home/bin/startup.sh

echo 'repubulish success!'

echo 'starting tail app log...'
sleep 5s
tail -f $tomcat_home/logs/$app_log_prefix.log
