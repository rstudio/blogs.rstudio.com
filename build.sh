#!/usr/bin/env bash

mkdir -p "blogs"
mkdir -p "_public"

REPO_NAME="tensorflow-blog"
REPO_URL="https://github.com/rstudio/${REPO_NAME}.git"
OUTPUT_DIR="docs"
DEPLOY_DIR="tensorflow"

if [ ! -d "blogs/${REPO_NAME}" ]; then
  (cd blogs && git clone ${REPO_URL})
fi
(cd blogs/${REPO_NAME} && git pull)

rm -rf _public/${DEPLOY_DIR}
cp -r blogs/${REPO_NAME}/${OUTPUT_DIR} _public/${DEPLOY_DIR}








