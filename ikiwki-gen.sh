#!/bin/sh

OUTPUT_DIR=/tmp/ikiwiki

# Step 1. Clone the source Git repsitory.
git clone $GIT_URL $OUTPUT_DIR

# Step 2. Run ikiwiki on this directory
ikiwiki $OUTPUT_DIR /ikiwiki
