#!/usr/bin/env bash

mkdir -p "blogs"
mkdir -p "_public"

deploy_blog () {
  
  # parameters
  REPO_OWNER=$1
  REPO_NAME=$2
  OUTPUT_DIR=$3
  DEPLOY_DIR=$4
  
  # clone the repo if we need to
  if [ ! -d "blogs/${REPO_NAME}" ]; then
    (cd blogs && git clone "https://github.com/${REPO_OWNER}/${REPO_NAME}.git")
  fi
  
  # update the repo
  (cd blogs/${REPO_NAME} && git pull)

  # deploy 
  rm -rf _public/${DEPLOY_DIR}
  cp -r blogs/${REPO_NAME}/${OUTPUT_DIR} _public/${DEPLOY_DIR}
}


                # REPO_OWNER     # REPO_NAME             # OUTPUT_DIR       # DEPLOY_DIR
deploy_blog     rstudio          tensorflow-blog         docs               tensorflow
deploy_blog     rstudio          cran-security-blog      public             cran-security











