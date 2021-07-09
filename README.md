# cfk-step-by-step-example


1. Create a namespace for your Confluent Platform cluster

    ```
    YOUR_NAMESPACE=20210709-test

    kubectl create namespace ${YOUR_NAMESPACE}
    ```


2. Switch to your newly created namespace

    ```
    kubectl config set-context --current --namespace=${YOUR_NAMESPACE}
    ```

3. Deploy CFK from the Helm repo

    ```
    CFK_HOME=./cfk

    mkdir -p ${CFK_HOME}

    helm repo add confluentinc https://packages.confluent.io/helm --namespace ${YOUR_NAMESPACE}

    helm pull confluentinc/confluent-for-kubernetes --untar --untardir=${CFK_HOME}

    helm upgrade --install confluent-operator \
      confluentinc/confluent-for-kubernetes \
      --namespace ${YOUR_NAMESPACE}

    ```

4. Install Confluent plugin for interacting with Confluent for Kubernetes.  

    ```
    BUNDLE_DIR=./full-cfk-bundle

    #FIXME: options include `linux`, `darwin`, and `windows`
    ENVIRONMENT=linux

    # Install Confluent plugin for interacting with CFK
    wget https://confluent-for-kubernetes.s3-us-west-1.amazonaws.com/confluent-for-kubernetes-2.0.1.tar.gz

    mkdir ${BUNDLE_DIR} && tar -xvf confluent-for-kubernetes-2.0.1.tar.gz -C ${BUNDLE_DIR} --strip-components 1

    tar -xvf ${BUNDLE_DIR}/kubectl-plugin/kubectl-confluent-${ENVIRONMENT}-amd64.tar.gz -C /usr/local/bin/   
    ```

5. Deploy with sample custom resource (CR) aka the YAML file that contains all the specs for your components. 

    ```
    kubectl apply -f confluent-platform.yml 
    ```
