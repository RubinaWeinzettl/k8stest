# n8n (Test Cluster Deployment)

We deploy n8n via Helm (OCI chart from 8gears) to evaluate upgrades and persistence behavior.

## Key focus
- SQLite persistence using a PVC
- Pod restart test: does data survive?

## Storage model (single-node)
We use a static hostPath PV + PVC:
- PV path: /var/lib/n8n
- PVC: n8n-pvc (namespace: n8n)

Files:
- `apps/n8n/storage/pv-hostpath.yaml`
- `apps/n8n/storage/pvc.yaml`

## Helm values
The chart changed its ingress values schema between chart versions:
- chart 1.0.0: ingress paths as strings
- chart 2.0.1: ingress paths as objects with `path` and `pathType`

Values:
- `apps/n8n/helm/values-n8n-chart-1.0.0.yaml`
- `apps/n8n/helm/values-n8n-chart-2.0.1.yaml`

## Test: delete pod, verify data
See `apps/n8n/test/pod-restart-data-persistence-test.md`

