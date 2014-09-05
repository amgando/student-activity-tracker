## student activity logging

the intent of this project is to track our student use of the Ruby interpreter and to capture stderr and metadata as output.

there are many possible use cases for this data.

early tests show promise.

### architecture

this project is intended to be deployed on all (phase 1) student machines at a given location.

the student experience will not change from its current state but we will begin capturing every run of the ruby interpreter.


the system has 2 parts:

- activity monitor
  - every time the ruby interpreter is invoked
  - siphon off STDERR to queue
  - supplement interpreter activity with metadata
  - handoff control to ruby interpreter

- activity uploader
  - run at regular intervals (ie, every 10 mins)
  - pre-process captured data, converting it from yaml to json
  - upload json to Keen.IO
  - cleanup temp files

#### activity monitor

> this system is invoked every time a student runs the ruby interpreter at the console

```text
+------------+
| ruby-shim  |
+---+---+----+----> STDOUT \
    |   |                   |-->  typical student experience
    |  (T)+-------> STDERR /
    |   |
    |   +----------------------> /tmp/ruby-runs/stderr.1234
    |
    +---> create-metadata.sh

            /realtime      \
             - git.sh       |--> /tmp/ruby-runs/metadata.1234
             - machine.sh  /

```
notes:
- the numbers .1234 in this diagram represent a process id (PID).
  a new PID is generated for each invocation of the ruby-shim
- this requires that students use the command line to run their ruby scripts (and not `Cmd-B` from within sublime)


#### activity uploader

> this system is invoked at regular intervals by Mac OS launchd

```text

+--------------------------+
|  sh process-run-data.sh  |  (iterate over tmp files)
+----+---------------------+
     |
     +---> make-msg-yaml.sh PID
     |              |
     |              v
     |       yaml-to-json.js
     |              |
     |              v               +---------+
     |      upload-run-data.sh ---> | Keen.IO |
     |                              +---------+
     |
     +--->  rm metadata.PID
            rm stderr.PID
            rm stderr_pipe.PID

```

### credits

- @quackingduck
- @mikelikesbikes
- @supertopher
- @amgando
- @mweitzel

*am i missing anyone?*

### testing

the `test` folder has a bunch of scripts that will invoke the individual modules with dummy data. they're technically not "tests" because they don't have any assertions. use these scripts during development.

### project history

**August 20 - August 25**

re-write:
- to address some of the major issues with the first version
- to rename the project
- for me to practice writing shell scripts
- for me to practice using git and github

**July 30 - August 20**

- version 0.1 is written, deployed and tested on a small subset of machines.
- repo: https://github.com/Devbootcamp/student-error-logger

**July 22 - July 30**

- an email thread erupts
  https://gist.github.com/amgando/415fa69b7d660888ca04

