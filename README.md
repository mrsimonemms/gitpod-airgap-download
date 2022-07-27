#  Gitpod Airgap Download

Download and push airgapped images to a registry

This requires the following secrets creating in your GitHub settings:

| Name | Description | Example |
| --- | --- | --- |
| GITPOD_BUNDLE_URL | The download URL of the bundle. This is in the Replicated Vendor portal | `https://s3.amazonaws.com/airgap.replicated.com/259YYCMTfMbbN8zxJSvlWjsBDEI/30.airgap` |
| KOTSADM_VERSION | The version of KOTS to use | `1.77.0` |
| REGISTRY_PASSWORD | The registry password | `q1w2e3r4` |
| REGISTRY_URL | The registry URL | `gitpod.azurecr.io` |
| REGISTRY_USERNAME | The registry username | `gitpod` |
