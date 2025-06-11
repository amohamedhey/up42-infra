#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Path to the dashboard JSON relative to the script's location
DASHBOARD_FILE="$SCRIPT_DIR/../grafana-dashboards/minio-dashboard.json"

if [[ ! -f "$DASHBOARD_FILE" ]]; then
  echo "Error: Dashboard file not found at $DASHBOARD_FILE"
  exit 1
fi

# Create a configmap for the MinIO dashboard
kubectl create configmap minio-dashboard \
  --from-file=minio-dashboard.json="$DASHBOARD_FILE" \
  -n monitoring \
  --dry-run=client -o yaml |
  kubectl apply -f -

# Restart Grafana pods to reload the dashboard
_grafana_pods=$(kubectl -n monitoring get pod -l app.kubernetes.io/name=grafana -o=jsonpath='{.items[*].metadata.name}')

for pod in $_grafana_pods; do
  kubectl -n monitoring exec -i "$pod" --container grafana -- kill 1
  echo "Pod: $pod has been killed"
  echo "--------------------------------"
  sleep 5
done
