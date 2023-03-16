#! /bin/bash
helm upgrade --install argo argo/argo-workflows --version 0.22.14 --namespace argo --create-namespace --values ./value-overrides.yaml

export ARGO_TOKEN="Bearer $(kubectl create token argo-user argo-argo-workflows-server --namespace argo)"
echo "$ARGO_TOKEN"

kubectl --namespace argo wait deploy --all --for condition=Available --timeout 2m
open http://localhost:2746
kubectl --namespace argo port-forward --address 0.0.0.0 svc/argo-argo-workflows-server 2746:2746
