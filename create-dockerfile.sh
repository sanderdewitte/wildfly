#!/bin/bash

EXPECTED_ARGS=2
if [ $# -lt $EXPECTED_ARGS ]
then echo -e "\nUsage:\n $0 username password \n";
exit 2
fi

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

DOCKERFILE_TEMPLATE_NAME="Dockerfile.tpl"
DOCKERFILE_NAME="Dockerfile"
FULL_PATH_TO_DOCKERFILE="$SCRIPT_DIR/$DOCKERFILE_NAME"

## create Dockerfile from template
cp $SCRIPT_DIR/$DOCKERFILE_TEMPLATE_NAME $FULL_PATH_TO_DOCKERFILE

## modify Dockerfile to update username
sed -i "s:{USER}:$1:g" $FULL_PATH_TO_DOCKERFILE
## modify Dockerfile to update password
sed -i "s:{PASS}:$2:g" $FULL_PATH_TO_DOCKERFILE

exit 0
