kubectl config use-context k3d-oberkorn
kubectl delete -f ingress-jfvilas.yaml

kubectl delete -f deployment-demo.yaml
kubectl delete -f deployment-app1.yaml
kubectl delete -f deployment-app2.yaml

docker build -f Dockerfile-demo -t demo-nginx .
docker build -f Dockerfile-app1 -t app1-nginx .
docker build -f Dockerfile-app2 -t app2-nginx .

call k3d image import demo-nginx:latest -t -c oberkorn
call k3d image import app1-nginx:latest -t -c oberkorn
call k3d image import app2-nginx:latest -t -c oberkorn

kubectl apply -f deployment-demo.yaml
kubectl apply -f deployment-app1.yaml
kubectl apply -f deployment-app2.yaml

kubectl apply -f ingress-jfvilas.yaml
