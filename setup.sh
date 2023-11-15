#!/bin/bash
set -e

TRAINING_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd $TRAINING_DIR
vcs import < $TRAINING_DIR/repos.txt

if ! [ -d $TRAINING_DIR/ur_ws/src ]; then
  mkdir -p $TRAINING_DIR/ur_ws/src
  cd $TRAINING_DIR/ur_ws/src/
  cp -r ../../ur_driver/ .
  cp -r ../../ur_description/ .
  cp -r ../../warehouse_ros_mongo/ .
fi

if ! [ -d $TRAINING_DIR/day1_ws/src ]; then
  mkdir -p $TRAINING_DIR/day1_ws/src
  cd $TRAINING_DIR/day1_ws/src/
  cp -r ../../day1/students_copy/* .
fi

if ! [ -d $TRAINING_DIR/day2_ws/src ]; then
  mkdir -p $TRAINING_DIR/day2_ws/src
  cd $TRAINING_DIR/day2_ws/src/
  cp -r ../../day2/* .
fi

cd $TRAINING_DIR
rm -rf ur_driver/ ur_description/ warehouse_ros_mongo/ day1/ day2/
