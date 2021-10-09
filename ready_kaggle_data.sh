#!/bin/bash

if [ $# -ne 1 ]; then
  echo "error:input competition id as args" 1>&2
  exit 1
fi

COMP_NAME=$1

mkdir -p $COMP_NAME/input
kaggle competitions download -c $COMP_NAME -p $COMP_NAME/input
unzip $COMP_NAME/input/$COMP_NAME.zip -d $COMP_NAME/input$COMP_NAME
