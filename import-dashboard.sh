#!/bin/bash

# Create a configmap for the MinIO dashboard
kubectl create configmap minio-dashboard \
  --from-file=grafana-dashboards/minio-dashboard.json \
  -n monitoring \
  --dry-run=client -o yaml |
  kubectl apply -f -

# restart grafana to reload the dashboard
_grafana_pods=$(kubectl -n monitoring get pod -l app.kubernetes.io/name=grafana -o=jsonpath='{.items[*].metadata.name}')

for pod in $_grafana_pods; do
  kubectl -n monitoring exec -i $pod --container grafana -- kill 1
  echo "Pod: $pod has been killed"
  echo "--------------------------------"
  sleep 5;
done