#!/usr/bin/env bash

mkdir -p "blogs"
mkdir -p "_public"

deploy_blog () {
  
  # parameters
  REPO_OWNER=$1
  REPO_NAME=$2
  OUTPUT_DIR=$3
  DEPLOY_DIR=$4
  OUTPUT_BRANCH=$5
  
  # clone the repo if we need to
  if [ ! -d "blogs/${REPO_NAME}" ]; then
    (cd blogs && git clone "https://github.com/${REPO_OWNER}/${REPO_NAME}.git")
  fi
  
  # update the repo
  if [ ! -z "${OUTPUT_BRANCH}" ]; then
    (cd blogs/${REPO_NAME} && git fetch origin ${OUTPUT_BRANCH})
    (cd blogs/${REPO_NAME} && git reset --hard origin/${OUTPUT_BRANCH})
  else
    (cd blogs/${REPO_NAME} && git pull)
  fi

  # deploy 
  rm -rf _public/${DEPLOY_DIR}
  cp -r blogs/${REPO_NAME}/${OUTPUT_DIR} _public/${DEPLOY_DIR}
}


                # REPO_OWNER     # REPO_NAME             # OUTPUT_DIR       # DEPLOY_DIR      # OUTPUT_BRANCH
deploy_blog     rstudio          ai-blog                 ''                 ai                'docs'
