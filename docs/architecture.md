# Architecture Overview

## Traffic flow (bare metal)
Client
→ local DNS (/etc/hosts) or LAN DNS
→ MetalLB external IP (LoadBalancer)
→ NGINX Ingress Controller
→ Service (ClusterIP)
→ Pods

## TLS strategy
- TLS is terminated at the Ingress layer.
- cert-manager requests and renews certificates automatically (Let's Encrypt DNS-01).
- Applications run behind the ingress and do not manage TLS themselves.

## Environments & promotion concept
The test cluster is used as a staging environment to validate:
- manifests/helm values
- persistence assumptions
- upgrade safety
- operational behavior under restarts

Promotion to production is done only after validation.

