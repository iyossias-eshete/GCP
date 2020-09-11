#!/bin/bash
DEV_SHELL_PROJECT_ID=$(gcloud config get-value project);
gcloud app create --project=$DEV_SHELL_PROJECT_ID;
git clone https://github.com/GoogleCloudPlatform/python-docs-samples;
cd python-docs-samples/appengine/standard_python3/hello_world;
sudo apt-get update;
sudo apt-get install python3-pip;
sudo apt-get install virtualenv;
virtualenv -p python3 venv;
source venv/bin/activate;
pip install  -r requirements.txt;
cd ~/python-docs-samples/appengine/standard_python3/hello_world;
gcloud app deploy;
gcloud app browse;
gcloud app versions stop v1