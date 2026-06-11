#!/bin/bash

declare -A projects=(
["repo-svcrepo-srcname"]="" 
["repo-svcrepo-srcname"]="" 
["repo-svcrepo-srcname"]="" 
["repo-svcrepo-srcname"]="" 
["repo-svcrepo-srcname"]="" 
["repo-svcrepo-srcname"]="" 
)

if [ -z "$1" ]; then
  echo "Parameter envpr/envp2/envp3/envcs must be supplied"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Parameter tenantrs/tenantsaas must be supplied"
  exit 1
fi

log_file="${2}_${1}_deployment_log.txt"

for project in "${!projects[@]}"; do
  if [ $(curl -s https://$2-$project-$1.envpr.url.mahesh.com/info | grep -c ${projects[$project]}) -eq 1 ]; then
    echo "$project ${projects[$project]} ===DEPLOYED OK===" | tee -a $log_file
  else
    echo "$project ${projects[$project]} ***NOT DEPLOYED***" | tee -a $log_file
  fi
done