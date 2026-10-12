#!/usr/bin/env bash
# deploy.sh - Kubernetes Exercise 1: Hello Pod Automation Script (Linux/macOS/WSL)

set -e

echo "=========================================="
echo " Zepto DevOps Exercise 1: Hello Pod Deploy"
echo "=========================================="

# 1. Check if minikube is running
echo -e "\n[1/5] Checking Minikube status..."
if ! minikube status >/dev/null 2>&1; then
    echo "Minikube is not running. Starting Minikube cluster..."
    minikube start
else
    echo "Minikube is running!"
fi

# 2. Deploy Pod
echo -e "\n[2/5] Deploying hello-k8s Pod..."
kubectl apply -f ../manifests/01-pod.yaml

# 3. Expose as NodePort Service
echo -e "\n[3/5] Deploying hello-k8s NodePort Service..."
kubectl apply -f ../manifests/02-service.yaml

# 4. Wait for Pod to become Ready
echo -e "\n[4/5] Waiting for Pod hello-k8s to enter Running state..."
kubectl wait --for=condition=Ready pod/hello-k8s --timeout=60s

# 5. Display Status and Service URL
echo -e "\n[5/5] Deployment Successful! Current Cluster State:"
kubectl get pods -l app=zepto-storefront
kubectl get svc hello-k8s

echo -e "\nOpening service in browser (Press Ctrl+C to exit tunnel if running)..."
minikube service hello-k8s
