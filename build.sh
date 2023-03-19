#!/bin/bash

# change the URL in the next line to your retrieve your fork/branch
git clone --depth 1 https://github.com/schlawg/lila.git

# same for any of these you want to customize
git clone --depth 1 https://github.com/lichess-org/lila-db-seed.git
git clone --depth 1 https://github.com/lichess-org/lila-ws.git
git clone --depth 1 https://github.com/lichess-org/lila-fishnet.git
git clone --depth 1 https://github.com/lichess-org/lifat.git

# if you need more services like lila-push or lila-gif, pull the code here and
# add an entry for each in docker-compose.yml

export UID="$(id -u)"
export GID="$(id -g)"

export ORIGIN=https://testy.lichess.dev

mkdir lila/lifat
cp -rp lifat lila/public
cp conf/lila.conf lila/conf/application.conf

docker-compose up -d

docker compose exec lila bash -c "/lila/ui/build -p"
