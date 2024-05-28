#!/bin/bash
#doitlive speed: 5
#doitlive prompt: [{user}@demo-3 {dir}]$
#doitlive commentecho: true

# Do not use "latest"
grep "image:" ../infrastructure-application/infrastructure-application.yaml

# Using "oc neat"
oc get Infrastructure cluster -o yaml
oc get Infrastructure cluster -o yaml | oc neat

# Do not add resources managed by Operators
oc get sts -n openshift-monitoring
oc get pods -n openshift-monitoring prometheus-k8s-0 -o yaml | head -n 50   