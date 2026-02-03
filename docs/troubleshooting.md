# Troubleshooting

## TLS shows "Not secure" even after Let's Encrypt issuance
Common cause: browser cache/HSTS from previous self-signed certs.
Fix: restart browser or clear HSTS entry for the hostname.

## PVC stuck in Pending
- PV/PVC mismatch (storageClassName, accessModes, capacity)
- no matching PV available
- static hostPath PV: do not require StorageClass; keep configuration minimal

