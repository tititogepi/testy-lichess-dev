# here is an example script that builds everything from scratch. use the 
# --force argument to force a clean database. we assume that you store the db
# files in your home directory.

if [ -d "$HOME/testy-lichess-dev" ]; then
  cd $HOME/testy-lichess-dev
  docker-compose down
fi

if [ ! -d "$HOME/db/.mongodb" ] || [ "$1" = "--force" ]; then
  rm -rf "$HOME/db/*"
  mkdir -p "$HOME/db"
  echo "Creating new database"
  INITDB=true
fi

cd "$HOME"
docker rmi $(docker images -q) # remove all docker images, this is "clean.sh" damnit!

rm -rf testy-lichess-dev testy-beta-docker

# /home/schlawg/testy-beta-docker is currently hard coded in the nginx.conf
# so we'll need to fix that before this actually works for a different user.
# might need a dedicated testy user
git clone https://github.com/schlawg/testy-lichess-dev

ln -sf testy-lichess-dev testy-beta-docker

cd testy-lichess-dev

./build.sh

if [ "$INITDB" ]; then
  # customize these passwords by modifying this script in your home directory on 
  # testy, not in your forked repo!
  #
  # example:
  # ./initdb.sh user_password admin_password
  #
  # otherwise you're getting the weak spamdb defaults
  ./initdb.sh
fi
