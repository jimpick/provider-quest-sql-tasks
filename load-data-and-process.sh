#! /bin/bash

set -e
set +x

wget https://sp-power-daily.feeds.provider.quest/provider-power-daily.csv
wget https://geoip.feeds.provider.quest/synthetic-regions-latest.json
wget https://provider-quest.s3.us-west-2.amazonaws.com/csp-regions-monthly.csv
wget https://deals-daily.feeds.provider.quest/deals-daily.csv

cat synthetic-regions-latest.json | jq .regions  | jq -r '(.[0] | keys_unsorted) as $keys | $keys, map([.[ $keys[] ]])[] | @csv' > synthetic-regions-latest.csv

export PGPASSWD=insecure

cat create-tables.sql | psql --host localhost -U postgres -d postgres -p 5432 -f -

cat <<EOF | psql --host localhost -U postgres -d postgres -p 5432 -f -

\copy provider_power_daily FROM 'provider-power-daily.csv' DELIMITER ',' CSV HEADER;
\copy deals_daily FROM 'deals-daily.csv' DELIMITER ',' CSV HEADER;
\copy synthetic_regions FROM 'synthetic-regions-latest.csv' DELIMITER ',' CSV HEADER;
\copy csp_regions_monthly FROM 'csp-regions-monthly.csv' DELIMITER ',' CSV HEADER;

EOF
