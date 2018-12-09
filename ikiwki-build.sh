#!/bin/bash

set -e

## ## #### ## #### ## #### ## ##
function progress() {
  if [[ -z ${VERSBOSE+x} ]]; then
    printf "$1"
  fi
}
## ## #### ## #### ## #### ## ##

# Two options:
#
# 1. Write to an externally mounted directory (/ikiwiki)
#
# 2. Sync to an S3-bucket

# Where we clone the Git repsitory:
GIT_WORK_DIR=/tmp/ikiwiki

# Step 1. Clone the source Git repsitory.
if [[ -z ${GIT_URL+x} ]]; then
  progress "Required environment variable GIT_URL missing; exiting\n"
  exit 1
else
  progress "Starting clone of Git repository '${GIT_URL}' ..."
  git clone --quiet $GIT_URL $GIT_WORK_DIR
  progress " finished clone of Git repository.\n"
fi

# Step 2. If the directory /ikiwiki exists, we put the output of the
# ikiwiki comand in /ikiwiki. Otherwise, we put it into
# /tmp/ikiwiki-output
if [[ -d "/ikiwiki" ]]; then
  IKIWIKI_OUTPUT_DIR="/ikiwiki"
else
  IKIWIKI_OUTPUT_DIR="/tmp/ikiwiki-output"
fi
progress "Will put ikiwiki output in ${IKIWIKI_OUTPUT_DIR}.\n"

progress "Starting to convert the site to ikiwiki ..."
ikiwiki $GIT_WORK_DIR $IKIWIKI_OUTPUT_DIR
progress " finished converting the site to ikiwiki.\n"

# Step 3. If the SYNC_S3 variable is set we do the syncing now
if [[ -z ${SYNC_S3+x } ]]; then
    progress "Skipping syncing to S3 (SYNC_S3 not set).\n"
else
    progress "About to sync ikiwiki site to S3 ..."
    # DO THE SYNC
    aws s3 cp $IKIWIKI_OUTPUT_DIR $SYNC_S3 --recursive
    progress " finished syncing ikiwiki site to S3.\n"
fi

# Finish
progress "Finished ikiwiki build.\n"
