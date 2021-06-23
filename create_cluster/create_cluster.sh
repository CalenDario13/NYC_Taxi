#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: ./create_cluster.sh  bucket-name  cluster-name"
    exit
fi

PROJECT=$(gcloud config get-value project)
BUCKET=$1
CLUSTER=$2
REGION=us-central1
ZONE=us-central1-a
INSTALL=gs://$BUCKET/install.sh

gcloud beta dataproc clusters create \
   --num-workers=5 \
   --worker-machine-type=e2-highmem-4 \
   --master-machine-type=e2-standard-2 \
   --master-boot-disk-type=pd-ssd \
   --worker-boot-disk-type=pd-ssd \
   --image-version=1.3-ubuntu18 \
   --enable-component-gateway \
   --optional-components=ANACONDA,JUPYTER \
   --zone=$ZONE \
   --region=$REGION \
   --initialization-actions=$INSTALL \
   $CLUSTER
   