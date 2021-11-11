#!/bin/bash

set -e

kubectl create secret generic bookinfo-dev-ratings-mongodb-secret --from-literal=mongodb-password=CHANGEME --from-literal=mongodb-root-password=CHANGEME

kubectl create configmap bookinfo-dev-ratings-mongodb-initdb --from-file=$HOME/ratings/databases/ratings_data.json --from-file=$HOME/ratings/databases/script.sh

helm install -f $HOME/ratings/k8s/helm-values/values-bookinfo-dev-ratings-mongodb.yaml bookinfo-dev-ratings-mongodb bitnami/mongodb --version 10.28.4
