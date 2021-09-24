#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t even -D # if using a theme, replace by `hugo -t <yourtheme>`

git add -A
# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..

#ssh honlyc@47.101.32.60 "cd blog/hedan806.github.io && git pull"
ssh root@39.98.62.127 "cd /home/tj/dnmp/www/hedan806.github.io && git pull"
