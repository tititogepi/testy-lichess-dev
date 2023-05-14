# For lichess developers
Use this repo to deploy a public lila instance on testy.lichess.dev.

## Requirements
You need a user and docker priviledges on khiaw (lichess.dev).

## Minimum steps
1. Fork this repo.
2. Change the first URL in `build.sh` to your lila fork and push the change(s) to github.
3. Login to khiaw with ssh. `ssh your_user@testy.lichess.dev`
4. Clone your fork of this repo to your home directory. `git clone https://github.com/your_user/testy-lichess-dev`
5. Copy the example scripts to home too. `cp testy-lichess-dev/bin/* ~`
6. Run `./clean.sh` the first time and any time you want to clean rebuild everything,
otherwise run `./reup.sh` to fetch changes, rebuild, and restart the running lila.
