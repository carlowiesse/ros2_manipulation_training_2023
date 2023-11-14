#!/bin/bash
set -e

TRAINING_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if ! [ -d $TRAINING_DIR/ros_workspace/src ]; then
  mkdir -p $TRAINING_DIR/ros_workspace/src
  cd $TRAINING_DIR/ros_workspace
  vcs import src < $TRAINING_DIR/repos.txt
  cd $TRAINING_DIR/ros_workspace/src/manipulation_training
  cp -r students_copy/* .
  rm -rf solutions/ students_copy/
fi