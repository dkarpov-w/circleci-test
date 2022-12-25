PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g')

echo "Package version is $PACKAGE_VERSION"
git tag $PACKAGE_VERSION

echo "Publishing version $PACKAGE_VERSION"
git push origin $PACKAGE_VERSION

