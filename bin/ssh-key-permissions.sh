#!/usr/bin/env bash
# Source: https://gist.github.com/grenade/6318301
# URL: https://gist.githubusercontent.com/grenade/6318301/raw/8626132fb176338f045053cfe695da5782a3347d/ssh-key-permissions.sh
chmod 700 ~/.ssh
chmod 644 ~/.ssh/authorized_keys
chmod 644 ~/.ssh/known_hosts
chmod 644 ~/.ssh/config
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
