#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: ./create_cluster.sh  bucket-name  region  zone"
    exit
fi

PROJECT=$(gcloud config get-value project)
BUCKET=$1
CLUSTER=$2
REGION=us-central1
ZONE=us-central1-a
INSTALL=gs://$BUCKET/install.sh

#upload install 
gsutil cp install.sh $INSTALL

gcloud beta dataproc clusters create \
   --num-workers=4 \
   --worker-machine-type=e2-standard-4 \
   --master-machine-type=e2-standard-4 \
   --image-version=1.3-ubuntu18 \
   --enable-component-gateway \
   --optional-components=ANACONDA,JUPYTER \
   --zone=$ZONE \
   --region=$REGION \
   --initialization-actions=$INSTALL \
   $CLUSTER
   