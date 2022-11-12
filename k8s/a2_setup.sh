#hard coded kind.exe at the moment because path not working

c:\KubInDocker\kind.exe create cluster --name kind-1 --config kind/cluster-config.yaml

# verify cluster commands
docker ps -a
kubectl cluster-info
kubectl get nodes

cd manifests

# app deploy
kubectl apply -f app-deployment.yaml
# verify deployment
kubectl get deployment/backend
kubectl get po -l app=backend

# apply service
kubectl apply -f service.yaml
# verify service
kubectl get svc

# apply ingress controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
# verify ingress controller
kubectl -n ingress-nginx get deploy

# apply ingress obj
kubectl apply -f ingress.yaml
# verify ingress obj
kubectl get ingress
