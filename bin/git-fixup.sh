#!/bin/sh

# from https://stackoverflow.com/a/28319271
# if this doesn't help, also try https://stackoverflow.com/a/18738164

set -e

if [ $# -eq 0 ]; then
    dir="."
else
    dir="$1"
fi

if [ ! -d "$dir" ]; then
    echo "not a dir: $dir"
    exit 1
fi

if [ ! -d "$dir/.git" ]; then
    echo "not a git repo: $dir"
    exit 1
fi

cd "$dir"

files=$(find .git/refs -type f)

for f in $files; do
    id=$(cat "$f")
    if ! git rev-parse --quiet "$id" \
    >/dev/null 2>&1; then
    continue
    fi
    if ! git rev-parse --quiet --verify "$id^{commit}" \
    >/dev/null 2>&1; then
    echo "Removing ref $f with missing commit $id"
    rm "$f"
    fi
done

if [ ! -f .git/packed-refs ]; then
    exit 0
fi

packfiles=$(cat .git/packed-refs \
    | grep -v '#' \
    | awk '{print $2}')

for f in $packfiles; do
    if ! git rev-parse --quiet --verify "$f" \
    >/dev/null 2>&1; then
    continue
    fi
    id=$(git rev-parse "$f")
    if ! git rev-parse --quiet --verify "$id" \
    >/dev/null 2>&1; then
    continue
    fi
    if ! git rev-parse --quiet --verify "$id^{commit}" \
    >/dev/null 2>&1; then
    echo "Removing packed ref $f with missing commit $id"
    git update-ref -d $f
    fi
done
git reflog expire --expire=now --all
git gc --prune=now
git fsck --full
