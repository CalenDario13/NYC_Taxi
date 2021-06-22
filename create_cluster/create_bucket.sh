#!/bin/bash

BUCKET=$1

gsutil mb gs://$BUCKET
gsutil cp -r kaggle.json gs://$BUCKET