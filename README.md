# For lichess devs
Use this repo to deploy a public lila instance on testy.lichess.dev.

## Requirements
You need a user and docker priviledges on khiaw (lichess.dev).

## Minimum steps
1. Fork this repo - leave the name alone if you want to minimize additional changes
2. Change the URL in the first line of build.sh to the lila repo you want to deploy and commit.
3. `ssh your_user@testy.lichess.dev`
4. `git clone https://github.com/your_user/testy-lichess-dev`
5. `cp testy-lichess-dev/bin/* ~`
6. Customize the generated user passwords in `clean.sh`
7. Run `./clean.sh` the first time and anytime you want to rebuild the entire universe,
otherwise just run `./reup.sh` every time you want to rebuild & restart lila.