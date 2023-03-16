#! /bin/bash
kubectl -n argo port-forward deployment/argo-server 2746:2746 &
open https://localhost:2746
fg
