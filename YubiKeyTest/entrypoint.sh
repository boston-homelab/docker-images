#!/bin/bash
set -e
RUNSOMETHING=$@

# launch pcscd so Yubkey can be read by ykman.
pcscd -d >/dev/stdout 2>/dev/stderr

if [ -z "$@" ]
then
      printf "Usage:\n
      docker run --rm --priviledge --v /dev/bus/usb:/dev/bus/usb IMAGE[:VERSION] [COMMAND]\n\n"
      printf "Example:\n
      docker run --rm --privileged -v /dev/bus/usb:/dev/bus/usb IMAGE[:VERSION] \"ykman piv info\"\n
      docker run -it --rm  --privileged -v /dev/bus/usb:/dev/bus/usb IMAGE[:VERSION] zsh\n"
else
    # Run the main container command
    exec $RUNSOMETHING
fi

