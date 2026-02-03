# MetalLB

We installed MetalLB to enable `Service type: LoadBalancer` on a bare metal cluster.

Reference implementation followed the k0s documentation example.

Post-install verification:
- `kubectl get pods -n metallb-system`
- `kubectl get svc -A | grep LoadBalancer`

