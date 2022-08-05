#!/bin/bash

set -euo pipefail

# Ensure that all the variables are set
echo "KOTSADM_VERSION: ${KOTSADM_VERSION}" > /dev/null
echo "REGISTRY_URL: ${REGISTRY_URL}" > /dev/null
echo "REGISTRY_USERNAME: ${REGISTRY_USERNAME}" > /dev/null
echo "REGISTRY_PASSWORD: ${REGISTRY_PASSWORD}" > /dev/null
echo "GITPOD_BUNDLE_URL: ${GITPOD_BUNDLE_URL}" > /dev/null

echo "Let's Go Mr Driver!"

# Install KOTS
curl "https://kots.io/install/${KOTSADM_VERSION}" | bash
kubectl-kots version

# Download kotsadm bundle
mkdir -p ./kotsadm
wget "https://github.com/replicatedhq/kots/releases/download/v${KOTSADM_VERSION}/kotsadm.tar.gz" -O ./kotsadm/kotsadm.tar.gz

# Upload the kotsadmin bundle
kubectl-kots admin-console push-images \
  ./kotsadm/kotsadm.tar.gz \
  "${REGISTRY_URL}/gitpod" \
  --registry-username "${REGISTRY_USERNAME}" \
  --registry-password "${REGISTRY_PASSWORD}"

# Download the Gitpod bundle
mkdir -p ./gitpod
wget "${GITPOD_BUNDLE_URL}" -O ./gitpod/gitpod.airgap

# Upload the Gitpod bundle
kubectl-kots admin-console push-images \
  ./gitpod/gitpod.airgap \
  "${REGISTRY_URL}/gitpod" \
  --registry-username "${REGISTRY_USERNAME}" \
  --registry-password "${REGISTRY_PASSWORD}"
