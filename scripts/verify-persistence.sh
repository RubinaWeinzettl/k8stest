#!/usr/bin/env bash
set -euo pipefail

NS="${1:-n8n}"
echo "Namespace: ${NS}"

kubectl get pvc -n "${NS}" || true
kubectl get pods -n "${NS}" || true

