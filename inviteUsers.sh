#!/bin/bash


#curl -i -u "HSKL-TEST:kalisa0531" -X PUT -d '' "https://api.github.com/repos/HSKL-TEST/test_faka0004/collaborators/fog1992" 2>&1 | grep message || echo "OK, done."

# d='{"name":"'$className'_'$rn'","description":"'$description'","private":'$private',"auto_init":'$auto_init'}'
# echo $d;

token=$(<token.txt)

echo "Your Token: $token"

echo "Path to names list with GitHub-IDs (default ./gitnames.txt):"
read pathNames

if [[ "$pathNames" = "" ]]; then
  pathNames='gitnames.txt'
fi

echo "Input: $pathNames"

array=($(<$pathNames))
for ((i = 0; i < ${#array[@]}; ++i)); do
    if [[ ${array[$i]} = "repo:" ]]; then
      i=$i+1;
      repoName=${array[$i]}
      i=$i+1;
    fi

    echo "repoName: $repoName user: ${array[$i]}"

    curl -H "Authorization: token $token" \
    -X PUT \
    https://api.github.com/repos/fog1992/$repoName/collaborators/${array[$i]} \
    2>&1 | grep message || echo "OK, added user ${array[$i]}."
done

# for rn in $(<$pathNames); do
#   echo "the next name is $rn with github name $rn"
#   repoName=$className'_'$rn
#   echo "repoName: $repoName"
#   curl -H "Authorization: token $token" \
#   -X PUT \
#   https://api.github.com/repos/fog1992/$repoName/collaborators/$rn \
#   2>&1 | grep message || echo "OK, done."
# done
