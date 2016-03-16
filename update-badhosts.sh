#!/bin/bash

temp=`mktemp`
dir=`dirname $0`
badhosts="${dir}/badhosts"

echo $badhosts $temp $dir

cp "$badhosts" "$temp"

cut -d '|'  -f 4 /var/db/sshguard/blacklist.db >> "$temp"

sort -u "$temp" > "$badhosts"
rm "$temp"

if ! git diff-index --quiet HEAD
then
	git commit -am "Update bad host file at $(date "+%Y-%m-%d %H:%M:%S")"
fi

git pull -r && git push
