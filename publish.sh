#!/bin/bash
# exit when any command fails
set -e

# get from package.json -> "version"
PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g')

# commit info
COMMIT_AUTHOR_NAME=$(git log -1 --format="%an")
COMMIT_AUTHOR_EMAIL=$(git log -1 --format="%ae")
COMMIT_SUBJECT=$(git log -1 --format="%s")
COMMIT_BODY=$(git log -1 --format="%b")
COMMIT_NOTE=$(git log -1 --format="%N")
TAG_ANNOTATION="
$COMMIT_AUTHOR_NAME
$COMMIT_AUTHOR_EMAIL

$COMMIT_SUBJECT
$COMMIT_BODY
$COMMIT_NOTE"

git config user.email "CircleCI@mydomain.com"
git config user.name "CircleCI deploy"

<<<<<<< HEAD
<<<<<<< Updated upstream
echo "Package version -> $PACKAGE_VERSION"
echo "Message -> $COMMIT_MESSAGE"
=======
echo "Package version --> $PACKAGE_VERSION"
echo "-------------"
echo "Message --> $TAG_ANNOTATION"
echo "-------------"
>>>>>>> main
git tag $PACKAGE_VERSION -m "$COMMIT_MESSAGE"
=======
echo "Package version --> $PACKAGE_VERSION"
echo "-------------"
echo "Message --> $TAG_ANNOTATION"
echo "-------------"
git tag $PACKAGE_VERSION -m "$TAG_ANNOTATION"
>>>>>>> Stashed changes

echo "Publishing version $PACKAGE_VERSION"
git push origin $PACKAGE_VERSION
