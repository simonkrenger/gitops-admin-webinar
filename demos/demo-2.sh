#!/bin/bash
#doitlive speed: 5
#doitlive prompt: [{user}@demo-2 {dir}]$
#doitlive commentecho: true

# Lets see what we have
tree ..

# Use the Cluster GitOps instance
oc project openshift-gitops
oc apply -f ../app-of-apps/app-of-apps.yaml

# Check the Argo CD console
google-chrome https://openshift-gitops-server-openshift-gitops.apps.skrenger.sandbox2566.opentlc.com

# ApplicationSet example
cat demo-2/appset.yaml
oc apply -f demo-2/appset.yaml