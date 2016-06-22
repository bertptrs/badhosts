#!/bin/bash

temp=`mktemp`
dir=`dirname $0`
badhosts=badhosts

cd "$dir"

cp "$badhosts" "$temp"

cut -d '|'  -f 4 /var/db/sshguard/blacklist.db >> "$temp"

sort -u "$temp" > "$badhosts"
rm "$temp"

if [ $(git ls-files -m | wc -l) -gt 0 ]
then
	git commit -am "Update bad host file at $(date "+%Y-%m-%d %H:%M:%S")"
fi

if [ "$(git rev-parse origin/master)" != "$(git rev-parse master)" ]; then
	git pull -r && git push
fi
