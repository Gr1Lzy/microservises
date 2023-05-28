# Lab 6: Monitoring

## How to start

To run the project, run `./deploy.sh` in terminal

## How to test services monitoring in Grafana

Run the following script

``` sh
# Deploy Grafana
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install monitoring grafana/grafana

# Get credentials
echo "Username: $(kubectl get secret monitoring-grafana -o=jsonpath='{.data.admin-user}' | base64 -d)"
echo "Password: $(kubectl get secret monitoring-grafana -o=jsonpath='{.data.admin-password}' | base64 -d)"

echo "Go to dashboard http://localhost:2435"
kubectl port-forward svc/monitoring-grafana 2435:80
```

After signing in to Grafana Dashboard (using the URL and credentials from script above),
go to _'Explore -> Run Query'_ to run your metrics.

The service metrics are exposed via `/metrics` handler
of both **users** and **products** services

The metrics collected:
1. Total number of HTTP requests received
2. Time taken to process an HTTP request
3. Current number of database connections
4. Time taken to process a database query

