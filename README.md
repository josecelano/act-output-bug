## ACT bug

This is a sample repo to reproduce an `act` bug.

It seems you cannot get the value from a previous step output.

How to reproduce it:
```
git clone git@github.com:josecelano/act-output-bug.git
cd act-output-bug
act pull_request -j build
```

Remove cached docker image:
```
docker image rm act-github-actions-sample-action
```
If you change the sample action, you have to remove the docker image generated by `act`. That's the only way to force `act` to build the action docker image again.

This is the act `ouput`:
```
(base) josecelano@josecelano:~/Documents/github/josecelano/act-output-bug$ act pull_request -j build
[act bug workflow/build] 🚀  Start image=catthehacker/ubuntu:act-latest
[act bug workflow/build]   🐳  docker run image=catthehacker/ubuntu:act-latest platform= entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
[act bug workflow/build]   🐳  docker exec cmd=[mkdir -m 0777 -p /var/run/act] user=root
[act bug workflow/build]   🐳  docker cp src=/home/josecelano/Documents/github/josecelano/act-output-bug/. dst=/home/josecelano/Documents/github/josecelano/act-output-bug
[act bug workflow/build]   🐳  docker exec cmd=[mkdir -p /home/josecelano/Documents/github/josecelano/act-output-bug] user=
[act bug workflow/build] ⭐  Run actions/checkout@v2
[act bug workflow/build]   ✅  Success - actions/checkout@v2
[act bug workflow/build] ⭐  Run echo "::set-output name=var_1::$(echo hello)"
[act bug workflow/build]   🐳  docker exec cmd=[bash --noprofile --norc -e -o pipefail /home/josecelano/Documents/github/josecelano/act-output-bug/workflow/set_1] user=
[act bug workflow/build]   ⚙  ::set-output:: var_1=hello
[act bug workflow/build]   ✅  Success - echo "::set-output name=var_1::$(echo hello)"
[act bug workflow/build] ⭐  Run echo "::set-output name=var_2::$(echo world)"
[act bug workflow/build]   🐳  docker exec cmd=[bash --noprofile --norc -e -o pipefail /home/josecelano/Documents/github/josecelano/act-output-bug/workflow/set_2] user=
[act bug workflow/build]   ⚙  ::set-output:: var_2=world
[act bug workflow/build]   ✅  Success - echo "::set-output name=var_2::$(echo world)"
[act bug workflow/build] ⭐  Run set_3
[act bug workflow/build]   🐳  docker build -t act-github-actions-sample-action:latest --platform  /home/josecelano/Documents/github/josecelano/act-output-bug/.github/actions/sample-action
[act bug workflow/build]   🐳  docker run image=act-github-actions-sample-action:latest platform= entrypoint=[] cmd=[]
[act bug workflow/build]   ⚙  ::set-output:: var3=1234
| var3: 1234
[act bug workflow/build]   ✅  Success - set_3
[act bug workflow/build] ⭐  Run print
[act bug workflow/build]   🐳  docker exec cmd=[bash --noprofile --norc -e -o pipefail /home/josecelano/Documents/github/josecelano/act-output-bug/workflow/4] user=
| The diff output is: hello
| The diff output is: world
| The diff output is: 
[act bug workflow/build]   ✅  Success - print
```
You can find the verbose output [here](./output.md).

Docker version:
```
Docker version 20.10.9, build c2ea9bc
```

Docker [catthehacker/ubuntu:act-latest](./docker-inspect.json).