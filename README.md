## pre-requisites
kubernetes v1.22.3 installed.    
docker     
terraform.      
aws cli       



## setup kuberntes cluster
### option 1. using minikube
install minikube using below link-    
https://minikube.sigs.k8s.io/docs/start/     

### option 2. using EKS on AWS
```
cd terraform
terraform plan
terraform apply
```

get the kubecofnig set for EKS cluster -     
```
aws eks update-kubeconfig --name data-poc --region us-east-2
```

## Below steps help to deploy application in minikube env.
1. **build dockerfile**
```
minikube cp Dockerfile /home/docker/Dockerfile
minikube cp app.py /home/docker/app.py
minikube cp requirements.txt /home/docker/requirements.txt
minikube ssh
```
execute inside minikube node      
```
cd /home/docker
docker build -t counter-app:1 .
```
come out of minikube node.      
2. **deploy helm charts**         
```
cd helm
helm upgrade --install redis redis
helm upgrade --install counter counter
kubectl port-forward svc/counter 5000:5000
```




**Assumptions:**
1. for simplicity, redis is deployed as a single pod, however,it can be deployed as a cluster with master-slave architecture.
2. I have not added counter-app probes(liveness and readiness)  since only one api endpoint is exposed and hitting it through browser giving incorrect value since probes are also hitting it periodically.
