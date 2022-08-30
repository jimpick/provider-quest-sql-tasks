#! /bin/bash

docker rm -f pq-sql-publisher
docker run -it --name pq-sql-publisher pq-sql-publisher
#docker run -it --cap-add=SYS_ADMIN --entrypoint /bin/bash --cap-add=SYS_ADMIN --name pq-sql-publisher pq-sql-publisher
#docker run -it -u 0 --cap-add=SYS_ADMIN --entrypoint /bin/bash --cap-add=SYS_ADMIN --name pq-sql-publisher pq-sql-publisher
