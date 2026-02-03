# Argo CD

Argo CD is installed via Helm and exposed through the NGINX Ingress Controller.

The values file is in `apps/argocd/helm/values.yaml`.

Verification:
- `kubectl get pods -n argocd`
- `kubectl get ingress -A | grep argocd`
- `kubectl get certificate -A | grep argocd` (if cert-manager is used via ingress annotations)

