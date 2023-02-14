#!/bin/bash

terraform output kubeconfig | grep -v 'EOT' > ~/.kube/config
cat ~/.kube/config
export KUBE_CONFIG_PATH=~/.kube/config