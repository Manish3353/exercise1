# cleanup.ps1 - Delete resources created in Exercise 1

Write-Host "Cleaning up Exercise 1 Kubernetes resources..." -ForegroundColor Yellow

kubectl delete service hello-k8s --ignore-not-found=true
kubectl delete pod hello-k8s --ignore-not-found=true
kubectl delete pod zepto-custom-pod --ignore-not-found=true
kubectl delete configmap zepto-storefront-html --ignore-not-found=true

Write-Host "Cleanup completed successfully!" -ForegroundColor Green
