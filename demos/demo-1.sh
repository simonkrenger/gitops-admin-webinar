#!/bin/bash
#doitlive speed: 5
#doitlive prompt: [{user}@demo-1 {dir}]$
#doitlive commentecho: true

oc get argocd -A

oc new-project development-argocd

# Create a new Argo CD instance
head -n 30 demo-1/argocd.yaml
oc apply -f demo-1/argocd.yaml
oc get argocd argocd 
oc get pods  -w

# Enable ApplicationSets for "development-argocd" namespace
oc get argocd argocd  -o yaml | grep "applicationSetController"
oc patch argocd argocd -p '{"spec":{"applicationSet":{"sourceNamespaces":["development-argocd"]}}}' --type=merge
oc get argocd argocd  -o yaml | grep "applicationSetController"
oc get pods 

# Create a repository configuration in Argo CD
head demo-1/repository.yaml
oc apply -f demo-1/repository.yaml
oc get secret