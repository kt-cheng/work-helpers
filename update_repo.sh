#!/bin/bash

# Change directory to the parent folder containing the git repositories
cd ../path/to/git/repositories

# Loop through all directories in the current folder
for dir in */; do
  
  # Check if the directory is a git repository
  if [ -d "$dir/.git" ]; then
    
    echo "Check status of $dir..."
    cd "$dir"
    
    # Fetch the latest changes from the remote repository
    git fetch
    
    # Check the status of the local branch compared to the remote branch
    status=$(git status -uno)
    
    if [[ "$status" == *"Your branch is behind"* ]]; then
      echo "Pull changes in $dir..."
      git pull
    elif [[ "$status" == *"Your branch is up to date"* ]]; then
      echo "Repository in $dir is up to date."
    else
      echo "Repository in $dir has local changes or is diverged from the remote."
    fi
    
    cd ..
  fi
done