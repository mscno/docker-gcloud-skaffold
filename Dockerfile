FROM google/cloud-sdk:412.0.0-slim
LABEL maintainer "mscno"

ENV USE_GKE_GCLOUD_AUTH_PLUGIN=True

RUN apt-get update -y && \
    apt-get install -y kubectl && \
    apt-get install google-cloud-sdk-gke-gcloud-auth-plugin && \
    curl -Lo /usr/local/bin/skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 && chmod +x /usr/local/bin/skaffold && \
    curl -s https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh | bash && mv kustomize /usr/local/bin/kustomize

RUN gke-gcloud-auth-plugin --version