# Architecture & Operational Decisions

## Use MetalLB on bare metal
Kubernetes does not provide a cloud LoadBalancer on bare metal. MetalLB enables `Service type: LoadBalancer`.

## Ingress-NGINX as a single entry point
NGINX Ingress provides standard HTTP routing, TLS termination, and integrates well with cert-manager.

## cert-manager with Let's Encrypt (DNS-01)
DNS-01 avoids exposing HTTP challenges publicly and works well for local/bare-metal clusters.

## n8n persistence strategy (test cluster)
We initially used SQLite for simplicity.
Key requirement: data must survive pod restarts.

## Why we did NOT promote n8n v2 to production
During evaluation, persistence behavior (session/data) was not reliable enough with the selected chart + SQLite approach.
We decided to stop the rollout until the Helm chart/persistence strategy is production-safe.

