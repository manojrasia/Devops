#!/usr/bin/env bash

#Setting up env variable in macbook

# Source the .zprofile file to load environment variables
source ~/.zprofile

# Check if the environment variable is set
if [[ -z "${ARTIFACTORY_USERNAME}" ]]; then
  echo "ARTIFACTORY_USERNAME is not set."
  
  # Check if the variable is defined in .zprofile
  if ! grep -q "ARTIFACTORY_USERNAME=" ~/.zprofile; then
    # Prompt the user to enter a value for the variable
    read -p "Please enter a value for ARTIFACTORY_USERNAME: " ARTIFACTORY_USERNAME
    # Add the variable to .zprofile
    echo "export ARTIFACTORY_USERNAME=${ARTIFACTORY_USERNAME}" >> ~/.zprofile
    echo "Added ARTIFACTORY_USERNAME to ~/.zprofile"
  else
    # Source .zprofile to update the environment
    source ~/.zprofile
  fi
else
  echo "ARTIFACTORY_USERNAME is already set to: ${ARTIFACTORY_USERNAME}"
fi

# Print the value of the environment variable
echo "ARTIFACTORY_USERNAME is set to: ${ARTIFACTORY_USERNAME}"
