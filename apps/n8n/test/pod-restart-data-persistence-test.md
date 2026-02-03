# Pod restart data persistence test (n8n)

## Goal
Verify that n8n state survives a pod restart when using SQLite and a mounted PVC.

## Steps
1) Login to n8n and create:
   - a user
   - a small workflow (save it)
2) Delete the pod:
   kubectl delete pod -n n8n -l app.kubernetes.io/instance=my-n8n
3) Wait for the new pod to become Ready:
   kubectl get pods -n n8n -w
4) Re-open n8n:
   - user should still exist
   - workflow should still exist

## Note on sessions
It is acceptable that login sessions expire after a restart.
The critical requirement is that user/workflows/config are persisted.

