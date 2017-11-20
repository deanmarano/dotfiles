#!/usr/bin/env bash

find . -not \( -name .svn -prune -o -name .git -prune -o -name .gitmodules -prune \) -type f -print0 | xargs -0 sed -i '' -E "s/[[:space:]]*$//"
