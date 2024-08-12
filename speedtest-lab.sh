#!/usr/bin/env bash


speedtest-cli --secure --csv-header > speedtest_14.csv

#dont space !!!!!!!
servers_id="$(speedtest-cli --list --secure | grep -Eo '[0-9]+)' | sed 's/)//')"

#Sdata="$(speedtest-cli --list | grep -Eo '^.*[(]'"

for id in $servers_id; do
    echo "testing speed at server $id..."
    speedtest-cli --secure --server $id --csv >> speedtest_14.csv
    echo "server id $id test complete. you can see test data at speedtest_14.csv"
done

echo ""
echo "show data!"
echo ""
cat speedtest_14.csv
