#! /bin/bash

wget https://sp-power-daily.feeds.provider.quest/provider-power-daily.csv
wget https://geoip.feeds.provider.quest/synthetic-regions-latest.json
wget https://provider-quest.s3.us-west-2.amazonaws.com/csp-regions-monthly.csv
wget https://deals-daily.feeds.provider.quest/deals-daily.csv

cat synthetic-regions-latest.json | jq .regions  | jq -r '(.[0] | keys_unsorted) as $keys | $keys, map([.[ $keys[] ]])[] | @csv' > synthetic-regions-latest.csv

export PGPASSWD=insecure

exit

cat <<EOF | psql --host localhost -U postgres -d postgres -p 5432 -f -

DELETE FROM provider_power_daily;

\copy provider_power_daily FROM 'provider-power-daily.csv' DELIMITER ',' CSV HEADER;

EOF
