#!/bin/bash
set -e

TRAINING_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if ! [ -d $TRAINING_DIR/ros_workspace/src ]; then
  mkdir -p $TRAINING_DIR/ros_workspace/src
  cd $TRAINING_DIR/ros_workspace
  vcs import src < $TRAINING_DIR/repos.txt
  cd $TRAINING_DIR/ros_workspace/src
  rm -rf manipulation_training/
fi

if ! [ -d $TRAINING_DIR/day1_ws/src ]; then
  mkdir -p $TRAINING_DIR/day1_ws/src
  cd $TRAINING_DIR/day1_ws
  vcs import src < $TRAINING_DIR/repos.txt
  cd $TRAINING_DIR/day1_ws/src
  cp -r manipulation_training/students_copy/* .
  rm -rf ur_driver/ ur_description/ warehouse_ros_mongo/ manipulation_training/
fi