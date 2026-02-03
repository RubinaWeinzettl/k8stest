# Test Protocol: "Pod Restart is the Truth"

## Goal
Validate that an application deployment is safe under typical Kubernetes events:
- pod eviction
- pod deletion
- rolling updates
- node reboot (single-node test)

## Minimum tests
1) Deploy application with persistence enabled (PVC mounted).
2) Perform a stateful action (create user/config/workflow).
3) Delete the pod.
4) Verify the state is still present after the new pod becomes ready.

## Notes
- Session persistence (remaining logged in) is not always guaranteed and depends on app design.
- The critical check is: **user data and workflows/config must persist**.

