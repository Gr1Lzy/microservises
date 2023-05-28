#!/bin/bash

# First create the product ...
curl -X POST http://localhost:8001/api/v1/namespaces/default/services/local-service2-service/proxy/products -d '{"id":1,"name":"Shampoo","price":42}'

# ... and the user who bought it
curl -X POST http://localhost:8001/api/v1/namespaces/default/services/local-service1-service/proxy/users -d '{"id":1,"username":"JoeDoe","email":"joedoe@example.com","last_ordered_product":1}'

# Now run request multiple times to trigger circuit breaker
for ((i=1; i<=10; i++)) do
  curl -X GET http://localhost:8001/api/v1/namespaces/default/services/local-service1-service/proxy/users/product/1 &
  # NOTE: no delays between requests
done
