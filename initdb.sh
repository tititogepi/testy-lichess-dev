#!/bin/bash
# export UID="$(id -u)"
PW_ARGS=""
if [ $# -gt 1 ]; then
  # grab last two arguments
  PWDS="${@: -2}"
  echo "Initializing database with user password \"${PWDS% *}\" and admin password \"${@: -1}\""
  PW_ARGS="--password=${PWDS% *} --su-password=${@: -1}"
elif [ $# -gt 0 ]; then
  echo "Initializing database with all passwords \"${@: -1}\""
  PW_ARGS="--password=${@: -1}"
else
  echo "Initializing database with default passwords"
fi
docker compose run --rm -u ${UID:-1003} initdb bash -c "python3 /lila-db-seed/spamdb/spamdb.py --uri=mongodb://mongodb/lichess --drop-db --posts=50 --blogs=0 --user-bg=400 $PW_ARGS"
docker compose exec mongodb bash -c "mongosh --host mongodb lichess /lila/bin/mongodb/indexes.js"