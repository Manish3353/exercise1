#!/usr/bin/env bash
# cleanup.sh - Delete resources created in Exercise 1

echo "Cleaning up Exercise 1 Kubernetes resources..."

kubectl delete service hello-k8s --ignore-not-found=true
kubectl delete pod hello-k8s --ignore-not-found=true
kubectl delete pod zepto-custom-pod --ignore-not-found=true
kubectl delete configmap zepto-storefront-html --ignore-not-found=true

echo "Cleanup completed successfully!"
