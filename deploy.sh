#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
# if using a theme, replace with `hugo -t <YOURTHEME>`
hugo

echo -e "\033[0;32mHugo Done.\033[0m"
# Go To Public folder.
cd public

# Get Update from Remote Repoisty.
git pull origin master
echo -e "\033[0;32mPull updates from Remote Reposity.\033[0m"

# Add changes to git.
git add .

# Commit changes.
msg="[Release]Rebuilding Site `date`"
if [ $# -eq 1 ]
 then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

echo -e "\033[0;32mGit Push done!\033[0m"
# Come Back up to the Project Root
cd ..

echo -e "\033[0;32mDeploy done!\033[0m"