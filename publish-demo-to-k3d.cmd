kubectl delete -f demo-deployment.yaml
kubectl delete -f ingress-jfvilas.yaml

docker build -t demo-nginx .
call k3d image import demo-nginx:latest -t -c oberkorn

kubectl apply -f demo-deployment.yaml
kubectl apply -f ingress-jfvilas.yaml
