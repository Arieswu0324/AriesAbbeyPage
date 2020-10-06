#!/bin/sh

# If a command fails then the deploy stops
set -e

# remove public folder before deployment
rm -rf public

# Build the project.
hugo -t roxo 

# Go To Public folder
cd public

# Add changes to git.
git init
git add -A

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
#git push -f git@github.com:Arieswu0324/Arieswu0324.github.io.git master
git push origin master

# back to root dir
#cd ..
