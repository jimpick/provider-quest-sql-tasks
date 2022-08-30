#! /bin/bash

docker rm -f pq-sql-publisher
docker run -it --name pq-sql-publisher pq-sql-publisher
#docker run -it --cap-add=SYS_ADMIN --entrypoint /bin/bash --cap-add=SYS_ADMIN --name pq-sql-publisher pq-sql-publisher
#docker run -it -u 0 --cap-add=SYS_ADMIN --entrypoint /bin/bash --cap-add=SYS_ADMIN --name pq-sql-publisher pq-sql-publisher
#docker run -it --name pq-sql-publisher ghcr.io/provider-quest/provider-quest-sql-publisher@sha256:6869aa536cb31cbb59879559278094e766fce73316f817db6911dc68185687e4
