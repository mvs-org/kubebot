# Example of kubebot + Kubernetes

This example deploys:

- kubebot (this repo)
- hyperspace node (<https://github.com/mvs-org/metaverse-vm>)
- node-liveness-probe (<https://github.com/mvs-org/node-liveness-probe>)

The manifests are in [../deploy/manifests](../deploy/manifests/).

To build and apply the manifests with Kustomize:

```bash
cd example
kustomize build . | kubectl diff -f -
kustomize build . | kubectl apply -f -
```

You can execute the following command to clean up that resource created above

```bash
kustomize build . | kubectl delete  -f -
kubectl delete pvc data-kubebot-hyperspace-0
```
