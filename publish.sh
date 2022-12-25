#!/bin/bash
# exit when any command fails
set -e

# get from package.json -> "version"
PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g')

git config user.email "CircleCI@mydomain.com"
git config user.name "CircleCI deploy"

echo "Package version --> $PACKAGE_VERSION"

git tag $PACKAGE_VERSION

echo "Publishing version $PACKAGE_VERSION"
git push origin $PACKAGE_VERSION
