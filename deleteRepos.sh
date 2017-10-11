# del repo script
#!/bin/bash

token=$(<token.txt)

echo "Your Token: $token"

echo "class name:"
read className

echo "Path to names list (default ./names.txt):"
read pathNames

if [[ "$pathNames" = "" ]]; then
  pathNames='names.txt'
fi


echo "name of the organization?"
read orgName;


for rn in $(<$pathNames); do
  echo "the next name is $rn"
  repoName="$className"'_'"$rn"
  url="https://api.github.com/repos/$orgName/$repoName"
  echo $url
  curl -i -X DELETE -H "Authorization: token $token" $url
done
