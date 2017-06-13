#!/bin/bash

#repo_name=$1
#test -z $repo_name && echo "Repo name required." 1>&2 && exit 1
#curl -u 'your_github_username' https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"

token=$(<token.txt)

echo $token

echo "Pfad zur Teilnehmerliste eingeben (default ./names.txt):"
read pathNames

if [[ "$pathNames" = "" ]]; then
  pathNames='names.txt'
fi

echo "private (y/n)?"
read private
if [ "$private" = "y" ]; then
  private="true"
else
  private="false"
fi

echo "auto_init (y/n)?"
read auto_init
if [ "$auto_init" = "y" ]; then
  auto_init="true"
else
  auto_init="false"
fi

echo "Eingabe: $pathNames private: $private"

for rn in $(<$pathNames); do
    echo "the next name is $rn"
    d='{"name":"'$rn'","private":'$private',"auto_init":'$auto_init'}'
    echo $d;
    curl -H "Authorization: token $token" \
    https://api.github.com/user/repos \
    -d $d

done
