CLUSTER=$1

gcloud dataproc clusters delete $CLUSTER --region us-central1
gsutil rm -r gs://dataproc-staging-us-central1-335361100481-glio0kgy
gsutil rm -r gs://dataproc-temp-us-central1-335361100481-3dzbxcwx
