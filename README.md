# Classwork-simple-K8s-project

Here you can see the diagram of the Class-Work-App:
===================================================
![k8s class work](https://user-images.githubusercontent.com/106809238/222407156-2839a019-eb10-495f-9d27-99eb4589b6c8.jpg)

Explanation of the steps:
=========================
step 1: bulid the dockerfile to the dockerhub repository (if needed to change)
*** ***For be sure that you in the right dockerhub please use the commands*** `docker logout` ***after that*** `docker login` *** 
1. Go to the correct directory folder in the system where the dockerfile exists, with the main code directory (very important!)
2. Use the command `docker build . -t <your username>/<name-of-app:version>`
3. Use the command `docker push <your username>/<name-of-app:version>`

step 2: deployment in the cluster, The previous requests
1. Go to the correct directory folder in the system by the name "deploymant-app"
2. Use the command `kubectl apply -f mysql-secret.yaml`

step 3: deployment in the cluster, The app deployments
1. Use the command `kubectl apply -f mysql-deploment-nfs.yaml`
2. Use the command `kubectl get all` to see that mysql-deploment-nfs POD is running proper
3. Use the command `kubectl apply -f mongo-deployment-nfs.yaml`
4. Use the command `kubectl get all` to see that mongo-deploment-nfs POD is running proper
5. Use the command `kubectl apply -f myapp-deploment.yaml`
6. Finally use the command `kubectl get all` to see that all PODS and deployments in running status

step 4: Show the project in the Web
1. Go to the browser and enter the link http:\\localhost:3043, for see the resulte

Files and description:
======================
1. myapp-deploment.yaml - 
The container image is guypeeril/test1:14.17.0 with a pull policy of Always. 
It exposes port 3043 and sets an environment variable for the MongoDB URL. 
It also mounts a volume at the specified path with a read-write permission.
The Service exposes the deployment as a NodePort with a target port of 3043, a node port of 31001, and a TCP protocol.
It matches the labels for the deployment and app.

2. mysql-deploment-nfs.yaml -
The container image is mysql:8.0.18 and exposes port 3306.
It sets an environment variable for the MySQL root password using a secretKeyRef to retrieve the value from a secret named mysql-secret-PASSWORD
That is base64 encoded.
It also mounts a volume at the specified path with a read-write permission.
The Service exposes the deployment as a NodePort with a target port of 3306, a node port of 32111, and no protocol specified.
It matches the labels for the deployment and app.

3. mysql-secret.yaml - 
This is a Kubernetes secret resource named "mysql-secret".
It contains the encoded value of the "MYSQL_ROOT_PASSWORD" key, which has a value of "cGFzc3dvcmQ=".
When applied, this secret can be used to pass sensitive information like passwords to a container running in a pod securely.

4. mongo-deployment-nfs.yaml -
This deployment creates a single replica of a MongoDB container using version 5.0.5.
The container is mounted with a persistent storage volume named "mongo-persistent-storage" using an NFS server located at "45.93.93.174" and a host path "/home/ilay/PROJECT/mongodb".
The deployment also creates a service named "mongo-service" with a port and target port of 27017,
and selects the MongoDB container based on the labels "name: mongo-service" and "app: class-work-app".

5. dockerfile - 
This is a Dockerfile used for building a Docker image for a Node.js application, with all is installation needed.
