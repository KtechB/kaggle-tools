#!/bin/bash

if [ $# -ne 1 ]; then
  echo "error:input competition id as args" 1>&2
  exit 1
fi

COMP_NAME=$1
SEARCH_COUNT=$(kaggle competitions list -s $COMP_NAME|grep $COMP_NAME -c)

if [ $SEARCH_COUNT -ne 1 ]; then
  echo "error:competition:$COMP_NAME is not found" 1>&2
  exit 1
fi

mkdir -p $COMP_NAME/input
kaggle competitions download -c $COMP_NAME -p $COMP_NAME/input
unzip $COMP_NAME/input/$COMP_NAME.zip -d $COMP_NAME/input/$COMP_NAME
rm $COMP_NAME/input/$COMP_NAME.zip
mkdir $COMP_NAME/src

