#!/bin/bash

USER=lollipop907
ID=${USER_ID:-1000}

if [ $ID -eq `id -u` ]; then
    exec "$@"
else
    useradd --shell /bin/bash -u $ID $USER
    echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
    exec gosu $USER "$@"
fi
