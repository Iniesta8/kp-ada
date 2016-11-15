#!/bin/bash
# Usage: initada.sh <project_name>

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <project_name>" >&2
  exit 1
fi

PROJECT_NAME=$1
echo "> Create new Ada project $PROJECT_NAME"

# Copy base project
echo "> Copy base project"
cp -r BaseProject $PROJECT_NAME

# Rename project files properly
echo "> Rename project files properly"
sed -e 's/Base/'"$PROJECT_NAME"'/g' \
  -e 's/base/'"$PROJECT_NAME"'/g' \
  <$PROJECT_NAME/Base.gpr >$PROJECT_NAME/$PROJECT_NAME.gpr

sed -e 's/Base/'"$PROJECT_NAME"'/g' \
  <$PROJECT_NAME/src/base.adb >$PROJECT_NAME/src/$PROJECT_NAME.adb

echo "> Cleanup"
rm $PROJECT_NAME/Base.gpr
rm $PROJECT_NAME/src/base.adb

echo ""
echo "> Project created! (`pwd`/$PROJECT_NAME)"

