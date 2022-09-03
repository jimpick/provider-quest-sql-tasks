FROM ubuntu/postgres

RUN useradd ubuntu

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN apt install -y python3 vim less wget tmux curl psmisc htop rsync build-essential cowsay unzip rclone jq

RUN mkdir /home/ubuntu
WORKDIR /home/ubuntu/provider-quest-sql-publisher

COPY . .

RUN chown -R ubuntu. /home/ubuntu

USER ubuntu

CMD ./load-data-and-process.sh 

