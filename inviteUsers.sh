#!/bin/bash


token=$(<token.txt)

echo "Your Token: $token"

echo "Path to names list with GitHub-IDs (default ./gitnames.txt):"
read pathNames



if [[ "$pathNames" = "" ]]; then
  pathNames='gitnames.txt'
fi

echo "organization (y/n)?"
read org
if [[ "$org" = "y" ]]; then
  isOrg="true"
  echo "name of the organization?"
  read orgName;
else
  isOrg="false"
  echo "Repo owner:"
  read user
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

    if [[ $isOrg = true ]]; then
      curl -H "Authorization: token $token" \
      -X PUT \
      https://api.github.com/repos/$orgName/$repoName/collaborators/${array[$i]} \
      2>&1 | grep message || echo "OK, added user ${array[$i]}."
    else
      curl -H "Authorization: token $token" \
      -X PUT \
      https://api.github.com/repos/$user/$repoName/collaborators/${array[$i]} \
      2>&1 | grep message || echo "OK, added user ${array[$i]}."
    fi
done
