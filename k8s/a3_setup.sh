cd manifests

# apply metric server
kubectl apply -f metrics-server.yaml
# check metric server
kubectl -n kube-system get deploy metrics-server

# apply hpa
kubectl apply -f hpa.yaml
# check hpa
kubectl describe hpa