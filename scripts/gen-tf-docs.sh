#!/bin/bash
set -e

EXCLUDED_PATH="terraform/environments/dev"

for dir in $(find . -type f -name "main.tf" -exec dirname {} \;); do
  # Skip the excluded path
  if [[ "$dir" == "./$EXCLUDED_PATH" ]]; then
    echo "Skipping $dir"
    continue
  fi

  echo "Running terraform-docs in $dir"
  terraform-docs markdown table "$dir" > "$dir/README.md"
done
