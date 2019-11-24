# Istio Rules

## Overview
Istio rules for chain-abstraction k8s cluster

The does two things:

1. Expose an istio-gateway
2. Expose the game jam abstraction service

## Prerequisites
Ensure you have a k8s cluster with istio installed

Check to see the everything is working by gettting the loadq balancer ip and port
```shell
kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}'
```

## To deploy
This will expose a default istio gateway and 
```shell
make gateway
make game-jam
```