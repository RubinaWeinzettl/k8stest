# NGINX Ingress Controller

We installed the NGINX Ingress Controller as the main HTTP(S) entry point.
On bare metal, it is exposed using `Service type: LoadBalancer` (MetalLB).

Post-install verification:
- `kubectl get pods -n ingress-nginx`
- `kubectl get svc -n ingress-nginx`
- ensure an external IP is assigned (MetalLB)

