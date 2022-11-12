#hard coded kind.exe at the moment because path not working

c:\KubInDocker\kind.exe create cluster --name kind-1 --config kind/cluster-config.yaml

# verify cluster commands
docker ps -a
kubectl cluster-info
kubectl get nodes

cd manifests

# app deploy
kubectl apply -f app-deploy-zone-aware.yaml
# verify deployment
kubectl get deployment/backend-zone-aware
kubectl get po -l app=backend-zone-aware

# apply service
kubectl apply -f service-zone-aware.yaml
# verify service
kubectl get svc

# apply ingress controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
# verify ingress controller
kubectl -n ingress-nginx get deploy

# apply ingress obj
kubectl apply -f ingress-zone-aware.yaml
# verify ingress obj
kubectl get ingress

# check pod to worker mapping (for some reason sort-by doesnt work, "no resources found in default namepace")
#kubectl get po -lapp=backend-zone-aware -owide --sort-by='.spec.nodeName'
kubectl get po -lapp=backend-zone-aware -owide