#!/usr/bin/env bash
set -euo pipefail

HOST="${1:-}"
if [[ -z "$HOST" ]]; then
  echo "Usage: $0 <hostname>"
  exit 1
fi

echo "Checking TLS certificate for: ${HOST}"
openssl s_client -connect "${HOST}:443" -servername "${HOST}" </dev/null 2>/dev/null \
  | openssl x509 -noout -issuer -subject -dates

