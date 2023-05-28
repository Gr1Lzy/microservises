# Lab 4: Kubernetes

## How to start

To run the project, run `./deploy.sh` in terminal

## How to test circuit breaker

To test circuit breaker, run `./break-circuit.sh` script.

It creates a user and a product,
then queries **product service** 10 times using **user service** as a proxy.

As these 10 requests run in parallel,
the circuit will break after the first one - you'll get the error message "no healthy upstream"

