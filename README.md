 # my-flask-app™ 
 my-flask-app is a super original name, not to mention application

 It uses cutting edge (flask) technology to print hello world right in your browser!
 
 # Build
 ## Docker build
 ```bash
 docker build -t my_flask_app:latest . 
 ```

# Install/ Run
## Running on Minikube
This assumes there is already a runing minikube server on the host and that it is able to access the local machines docker registry

## Manifests
To keep things simple this repo contains to yaml manifests namely:
- deployment.yaml # The actual deployment defition that spins up 3 replicas
- service.yaml # The service definition 

## Installation
###  Create a namespace
Let's not use the default namespace...
```bash
kubectl create ns my-flask-app
```

### Apply the manifests
```bash 
kubectl apply -f deployment.yaml -f service.yaml -n my-flask-app
```

# Accessing the application
Without declaring an ingress, we have to access the application on the defined NodePort

This also assumes there isn't already something listening on 30080 - if there is. Modify the service.yaml as needed. It should not affect the below curl command

```bash
curl http://$(minikube ip):$(kubectl get svc my-flask-app-service -n my-flask-app -o json | jq '.spec.ports[0].nodePort')
```


 # Author 
Riaan Annandale - riaana@mundane.co.za