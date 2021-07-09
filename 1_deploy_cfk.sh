#!/bin/bash

YOUR_NAMESPACE=20210709-test
CFK_HOME=./cfk

# Create a namespace for your Confluent Platform cluster
kubectl create namespace ${YOUR_NAMESPACE}


# Switch the your newly created namespace
kubectl config set-context --current --namespace=${YOUR_NAMESPACE}


# Deploy CFK from Helm repo 
mkdir -p ${CFK_HOME}
helm repo add confluentinc https://packages.confluent.io/helm --namespace ${YOUR_NAMESPACE}
helm pull confluentinc/confluent-for-kubernetes --untar --untardir=${CFK_HOME}
helm upgrade --install confluent-operator \
  confluentinc/confluent-for-kubernetes \
  --namespace ${YOUR_NAMESPACE}

