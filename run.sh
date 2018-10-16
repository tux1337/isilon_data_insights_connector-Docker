#!/bin/bash

[ -z "$CON_LOGLEVEL" ] && export CON_LOGLEVEL="error"

/opt/isilon_data_insights_connector/isi_data_insights_d.py -c /opt/isilon_data_insights_connector/conf/isi_data_insights_d.cfg -e $CON_LOGLEVEL -l /opt/isilon_data_insights_connector/log/isi_data_insights_d.log start

while sleep 60; do
  ps aux | grep isi_data_insights_d | grep -q -v grep
  PROCESS_1_STATUS=$?
 
  if [ $PROCESS_1_STATUS -ne 0 ]; then
    exit 1
  fi
done
