#!/bin/bash

BUNDLE_DIR=./full-cfk-bundle
ENVIRONMENT=darwin

# Install Confluent plugin for interacting with CFK
wget https://confluent-for-kubernetes.s3-us-west-1.amazonaws.com/confluent-for-kubernetes-2.0.1.tar.gz
mkdir ${BUNDLE_DIR} && tar -xvf confluent-for-kubernetes-2.0.1.tar.gz -C ${BUNDLE_DIR} --strip-components 1
tar -xvf ${BUNDLE_DIR}/kubectl-plugin/kubectl-confluent-${ENVIRONMENT}-amd64.tar.gz -C /usr/local/bin/   
