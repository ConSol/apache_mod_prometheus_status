#!/bin/bash

if [ "x$OMD_SITE" != "xdemo" ]; then
  echo "ERROR: this script should be run as demo user only."
  exit 3
fi

function finish {
  # kill all child procs since inotifywait might be still running
  ps -fu $OMD_SITE | grep $$ | grep inotifywait | awk '{ print $2 }' | xargs kill
}
trap finish EXIT

# keep watching for changes
while inotifywait -q -e close_write /src/src/*.c /src/cmd/mod_prometheus_status/*.go; do
  sleep 1
  /src/t/common/apache/build.sh
done

