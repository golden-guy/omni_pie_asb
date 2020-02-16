#!/bin/bash
# Define some variables first
GIT_AM_CMD="git am"
SOURCE_HOME=$(pwd)
PATCH_HOME=$(dirname ${0})
ASB_DIRS=$(find ${PATCH_HOME} -mindepth 1 -maxdepth 1 -type d | sort -n)

for ASB_DIR in $ASB_DIRS
do
  for PATCH_FILE in $(find $ASB_DIR -name "*.patch" | sort -n)
  do
    PATCH_DIR=$(dirname $PATCH_FILE)
    WORK_DIR=${PATCH_DIR/$ASB_DIR}
    cd $SOURCE_HOME/$WORK_DIR
    echo "$(pwd): $GIT_AM_CMD $PATCH_FILE"
    $GIT_AM_CMD $PATCH_FILE    
  done
  cd $SOURCE_HOME
done

echo "All done!"
exit 0
