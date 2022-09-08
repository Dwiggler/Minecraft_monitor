#!/bin/bash
#start of file
#script will check to see if serivice and process is running. If not, attempt to restart and email admin

service_check () {
        ps -ef | grep mine | grep -v grep | grep -v SCREEN | wc -l
}

process=$(ps -ef | grep mine | grep -v grep | grep -v SCREEN | wc -l)
screen=$(ps -ef | grep mine | grep -v grep | grep -v .jar | wc -l)

if [$screen -eq 0 && $process -eq 0]{
  service minecraft start
  #servrestart=$(true)

else
  if [$screen -eq 1 && $process -eq 0]{
    service minecraft stop
    x=0
    while [ $x -gt 0 ]
    do
            x=$(service_check)
    done
    service minecraft start
    #servrestart=$(true)
  }
}

#if [ $servrestart -eq "true"]{
#  echo "The service was restarted on " date %F-%H >> /tmp/minemonitor.out
#}
