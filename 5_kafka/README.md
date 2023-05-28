# Lab 5: Kubernetes

## How to start

To run the project, run `./deploy.sh` in terminal

## How to test Kafka

Start deployment with `./deploy.sh` and then trigger any API endpoint.
```sh
$ curl -X POST http://localhost:8001/api/v1/namespaces/default/services/local-service2-service/proxy/products -d '{"id":1,"name":"Shampoo","price":42}'
```

Then open Kubernetes logs for the pod which API handler was used.

```sh
$ kubectl logs local-logger-deployment-9cc88d494-lpmkx
2023/06/01 18:47:52 Listening topics...
2023/06/01 18:50:00 [Topic 2] Received message: {"ip":"127.0.0.6:57143","method":"POST","path":"/products"}
```

As you can see, the logs say the Logger service received message from Products service.
