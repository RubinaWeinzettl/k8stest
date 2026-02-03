#!/usr/bin/env bash
set -euo pipefail

echo "Ingresses:"
kubectl get ingress -A

echo
echo "Certificates:"
kubectl get certificate -A || true

