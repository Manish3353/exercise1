# deploy.ps1 - Kubernetes Exercise 1: Hello Pod Automation Script (Windows PowerShell)

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host " Zepto DevOps Exercise 1: Hello Pod Deploy" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

# 1. Check if minikube is running
Write-Host "`n[1/5] Checking Minikube status..." -ForegroundColor Yellow
$status = minikube status 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Minikube is not running. Starting Minikube cluster..." -ForegroundColor Yellow
    minikube start
} else {
    Write-Host "Minikube is running!" -ForegroundColor Green
}

# 2. Deploy Pod
Write-Host "`n[2/5] Deploying hello-k8s Pod..." -ForegroundColor Yellow
kubectl apply -f ../manifests/01-pod.yaml

# 3. Expose as NodePort Service
Write-Host "`n[3/5] Deploying hello-k8s NodePort Service..." -ForegroundColor Yellow
kubectl apply -f ../manifests/02-service.yaml

# 4. Wait for Pod to become Ready
Write-Host "`n[4/5] Waiting for Pod hello-k8s to enter Running state..." -ForegroundColor Yellow
kubectl wait --for=condition=Ready pod/hello-k8s --timeout=60s

# 5. Display Status and Service URL
Write-Host "`n[5/5] Deployment Successful! Current Cluster State:" -ForegroundColor Green
kubectl get pods -l app=zepto-storefront
kubectl get svc hello-k8s

Write-Host "`nOpening service in browser (Press Ctrl+C to exit tunnel if running)..." -ForegroundColor Cyan
minikube service hello-k8s
