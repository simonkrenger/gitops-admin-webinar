#!/bin/bash
#doitlive speed: 5
#doitlive prompt: [{user}@demo-2 {dir}]$
#doitlive commentecho: true

# App-of-Apps, ApplicationSets and Kustomize

tree -I demos/ ..
google-chrome https://openshift-gitops-server-openshift-gitops.apps.skrenger.sandbox2566.opentlc.com

# Use the Cluster GitOps instance
oc project openshift-gitops
oc apply -f ../app-of-apps/app-of-apps.yaml

# ApplicationSet example
cat demo-2/appset.yaml
oc apply -f demo-2/appset.yaml

# Kustomize
tree ../cluster-config/
cat ../cluster-config/kustomization.yaml
cat ../cluster-config/cluster-monitoring-config.yaml
oc get configmap cluster-monitoring-config -n openshift-monitoring
