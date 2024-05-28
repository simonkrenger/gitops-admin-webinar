#!/bin/bash

# Demo 1
oc delete secret repo-gitops-basics-demos -n development-argocd
oc delete argocd argocd -n development-argocd
oc delete namespace development-argocd

# Demo 2

oc create namespace application-guestbook
oc label namespace application-guestbook argocd.argoproj.io/managed-by=openshift-gitops
oc create namespace application-doodad
oc label namespace application-doodad argocd.argoproj.io/managed-by=openshift-gitops

# Demo 3

