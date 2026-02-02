# Kubernetes Homelab Test Cluster (Bare Metal) – GitOps-Oriented Staging Setup

This repository documents a private Kubernetes **test/staging cluster** running on a **single-node bare metal** setup (Thin Client, Debian 13).
The main purpose is to test new applications and upgrades in a controlled environment before promoting changes to a production cluster.

## Why this exists
- Learn Kubernetes by operating real workloads
- Build a production-like baseline (ingress, load balancer, TLS automation)
- Validate persistence and upgrade safety before production rollouts
- Establish a GitOps-ready workflow (Argo CD)

## Cluster baseline (high-level)
- **MetalLB** for `LoadBalancer` services on bare metal
- **NGINX Ingress Controller** as the HTTP(S) entry point
- **cert-manager + Let's Encrypt** (DNS-01) for automatic TLS certificates
- **Argo CD** installed via Helm, served through Ingress

## Repository layout
- `cluster/`: baseline components documentation (how and why)
- `apps/`: app-specific manifests and Helm values
- `docs/`: architecture, decisions, troubleshooting, test protocol
- `scripts/`: verification helpers for TLS/Ingress/persistence

## Key learning: "Pod restart is the truth"
A deployment is considered safe only if a pod restart does not lose business-critical data.
See: `docs/test-protocol.md` and `apps/n8n/test/pod-restart-data-persistence-test.md`.

## Case study: n8n upgrade to v2
We deployed n8n via Helm and evaluated an upgrade to major version 2.
Result: persistence behavior with SQLite + the evaluated Helm chart version was not reliable enough.
Therefore, **we did not promote n8n v2 to the production cluster**.

Details:
- `apps/n8n/README.md`
- `docs/decisions.md`

## Prerequisites
This repo assumes:
- Kubernetes is already installed (k0s-based setup in our case)
- MetalLB + Ingress-NGINX + cert-manager are running
- Local DNS or `/etc/hosts` entry points to the ingress/load balancer IP

## Quick verification
- TLS: `scripts/verify-tls.sh argocd.test.weinz.at`
- Ingress: `scripts/verify-ingress.sh`
- Persistence: `scripts/verify-persistence.sh n8n`
