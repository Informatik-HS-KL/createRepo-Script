## createRepo-Script

create GitHub-Repos withe a names list for students.

At First you have to save your GitHub-Accesstoken in a file (token.txt).

Inputs:
1. class name (will be used in Repo name and description)
2. path to names list  
3. private yes or no (default: public)
4. auto_init yes or no (default: without auto_init)
5. organization yes or no (default: no)
  1. name of the organization


## inviteUser-Script

create a list with the repo-names and the users:

```
repo: <repoName1> <usr1> <user2> ...
repo: <reponame2> <usr3> ...
...
```
Inputs:
1. path to names list with GitHub-IDs
2. organization yes or no (default: no)
  1. name of the organization

## deleteRepo-Script

deletes repos in organization created with the createRepo-Script. (Reponames: classname_user)

Iputs: 
1. class name
2. path to names list  
3. name of the organization
