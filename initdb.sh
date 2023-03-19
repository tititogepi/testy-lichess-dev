#!/bin/bash

export UID="$(id -u)"

echo "Initializing database with user password \"$1\" and admin password \"$2\""
docker compose exec mongodb bash -c "mongosh --host mongodb lichess /lila/bin/mongodb/indexes.js"
if [ $# -eq 2 ]; then
  docker compose run --rm -u $UID initdb bash -c "python3 /lila-db-seed/spamdb/spamdb.py --uri=mongodb://mongodb/lichess --password=$1 --su-password=$2"
else
  docker compose run --rm -u $UID initdb bash -c "python3 /lila-db-seed/spamdb/spamdb.py --uri=mongodb://mongodb/lichess"
fi

